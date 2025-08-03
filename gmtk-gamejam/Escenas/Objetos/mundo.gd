extends Node2D

@onready var muro_principal: StaticBody2D = $MuroPrincipal

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

func _process(delta: float) -> void:
	if jugador_dentro == true and Input.is_action_pressed("Presionar") and muro_destruido == false:
		muro_principal.queue_free()
		muro_destruido = true
		
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
		boton_activado = true

func _on_boton_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		jugador_dentro = false

func _on_area_saltador_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and boton_activado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE -= 2500
		salto_pontenciado = true

func _on_area_saltador_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and salto_pontenciado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE += 2500
		salto_pontenciado = false

func _on_area_nave_body_entered(body: Node2D) -> void:
	if boton_activado == true and body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Escenas/Interface/nieveles.tscn")
		Global.niveles += 1

#----------Coleccionables------------------------
func _on_coleccionable_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.monedas_nivel_1 += 1
		$Coleccionable.queue_free()

func _on_coleccionable_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.monedas_nivel_1 += 1
		$Coleccionable2.queue_free()

func _on_coleccionable_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.monedas_nivel_1 += 1
		$Coleccionable3.queue_free()
