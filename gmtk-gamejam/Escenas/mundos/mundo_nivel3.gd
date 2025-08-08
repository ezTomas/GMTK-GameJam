extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


var salto_pontenciado:bool = false
var jugador_dentro: bool = false
var boton_activado: bool = false
var muro_destruido: bool = false

@onready var player: RigidBody2D = $Player

@onready var camera: Camera2D = $Camera2D
var zoomactive=false
var cameraDefaultPosition
var cameraDefaultRotation
var cameraDefaultZoom

func _ready() -> void:
	if Global.monedas_nivel_3 >= 1:
		$Coleccionable.visible = false
	if Global.monedas_nivel_3 >= 2:
		$Coleccionable2.visible = false
	if Global.monedas_nivel_3 >= 3:
		$Coleccionable3.visible = false
	
	audio_stream_player.play()
	$Boton/AnimatedSprite2D2.play("default")

func _process(delta: float) -> void:
	if jugador_dentro == true and Input.is_action_pressed("Presionar"):
		boton_activado = true
		$Saltador/AnimatedSprite2D.play("default")
		$Boton/AnimatedSprite2D2.play("a")
		
	if Input.is_action_just_pressed("zoom"):
		if !zoomactive:
			
			var tween = get_tree().create_tween()
			##self.add_child(camera)
			cameraDefaultPosition=camera.get_position()
			cameraDefaultRotation=camera.rotation
			cameraDefaultZoom=camera.zoom
			camera.ignore_rotation=false
			camera.set_position(player.get_position())
			
			#tween.tween_property(camera, "rotation", self.rotation, 1)
			camera.rotation=player.rotation
			tween.tween_property(camera, "rotation", deg_to_rad(-90), .1)
			#camera.rotate(deg_to_rad(-90))
			camera.reparent(player)
			
			camera.make_current()
			tween.tween_property(camera, "zoom", Vector2(2,2), 1)
			#camera.zoom+=Vector2(2,2)
			zoomactive=true
			#ok
			
			print("estaba desactivado")
		else:
			var tween = get_tree().create_tween()
			##self.add_child(camera)
			camera.reparent(get_tree().current_scene)
			camera.set_position(cameraDefaultPosition)
			
			tween.tween_property(camera, "zoom", cameraDefaultZoom, .1)
			#camera.zoom=cameraDefaultZoom
			tween.tween_property(camera, "rotation", cameraDefaultRotation, 1)
			#camera.rotation=cameraDefaultRotation
			
			
			
			camera.ignore_rotation=true
			zoomactive=false
			print("estaba activado")

func _on_boton_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		jugador_dentro = true

func _on_boton_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		jugador_dentro = false

func _on_area_saltador_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and boton_activado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE -= 3500
		salto_pontenciado = true

func _on_area_saltador_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and salto_pontenciado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE += 3500
		salto_pontenciado = false

func _on_area_nave_body_entered(body: Node2D) -> void:
	if boton_activado == true and body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Escenas/Interface/menu_principal.tscn")
		Global.niveles += 1
		Global.save_data()

func _on_cueva_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Cueva2/PlanetaFuera.visible = false
		$Cueva2/CanvasModulate.visible = true
		$Player/PointLight2D.enabled = true

func _on_cueva_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		$Cueva2/PlanetaFuera.visible = true
		$Cueva2/CanvasModulate.visible = false
		$Player/PointLight2D.enabled = false


func _on_coleccionable_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and $Coleccionable.visible == true:
		Global.monedas_nivel_3 += 1
		Global.save_data()
		$Coleccionable.queue_free()

func _on_coleccionable_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and $Coleccionable2.visible == true:
		Global.monedas_nivel_3 += 1
		Global.save_data()
		$Coleccionable2.queue_free()

func _on_coleccionable_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and $Coleccionable3.visible == true:
		Global.monedas_nivel_3 += 1
		Global.save_data()
		$Coleccionable3.queue_free()
