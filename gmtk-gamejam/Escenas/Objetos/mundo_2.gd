extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer

var salto_pontenciado:bool = false
var jugador_dentro: bool = false
var boton_verde_activado: bool = false
var boton_rosa_activado: bool = false

@onready var player: RigidBody2D = $Player
@onready var camera: Camera2D = $Camera2D

var zoomactive=false
var cameraDefaultPosition
var cameraDefaultRotation
var cameraDefaultZoom

var jugador_dentro_verde: bool = false
var jugador_dentro_rosa: bool = false

func _ready() -> void:
	audio_stream_player.play()
	$"Boton Verde/Verda".play("default")
	$"Boton rosa/Rosa".play("default")

func _process(delta: float) -> void:
	if jugador_dentro_verde == true and Input.is_action_pressed("Presionar"):
		boton_verde_activado = true
		$"Saltador verde/AnimatedSprite2D".play("Nave verde")
		$"Boton Verde/Verda".play("a")
		
	if jugador_dentro_rosa == true and Input.is_action_pressed("Presionar"):
		boton_rosa_activado = true
		$"Boton rosa/Rosa".play("a")
		$"Saltador Rosa/AnimatedSprite2D".play("default")
		
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
func _on_area_nave_2_body_entered(body: Node2D) -> void:
	if boton_rosa_activado == true and body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Escenas/Interface/menu_principal.tscn")
		Global.niveles += 1

#-----------Codigo dfe boton y saltador verde ------------------
func _on_area_saltador_verde_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and boton_verde_activado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE -= 2500
		salto_pontenciado = true

func _on_area_saltador_verde_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and salto_pontenciado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE += 2500
		salto_pontenciado = false

func _on_boton_verde_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		jugador_dentro_verde = true


func _on_boton_verde_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		jugador_dentro_verde = false
		
#----------------------------------------------
#------------ Codigo boton y saltador rosa----------------------------

func _on_boton_rosa_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and boton_verde_activado == true:
		jugador_dentro_rosa = true
		

func _on_boton_rosa_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		jugador_dentro_rosa = false
		

func _on_area_saltador_rosa_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and boton_rosa_activado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE -= 2500
		salto_pontenciado = true

func _on_area_saltador_rosa_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and salto_pontenciado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE += 2500
		salto_pontenciado = false

#----------------------------------------------------------
#-----------Area Mortal---------------------------

func _on_area_mortal_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().reload_current_scene()
		
		
func _on_coleccionable_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.monedas_nivel_2 += 1
		$Coleccionable.queue_free()

func _on_coleccionable_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.monedas_nivel_2 += 1
		$Coleccionable2.queue_free()

func _on_coleccionable_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		Global.monedas_nivel_2 += 1
		$Coleccionable3.queue_free()
