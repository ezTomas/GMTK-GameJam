extends Node2D


var salto_pontenciado:bool = false
var jugador_dentro: bool = false
var boton_verde_activado: bool = true
var boton_rosa_activado: bool = true

var jugador_dentro_verde: bool = false
var jugador_dentro_rosa: bool = false

func _process(delta: float) -> void:
	if jugador_dentro_verde == true and Input.is_action_pressed("Presionar"):
		boton_verde_activado = true
	
	if jugador_dentro_rosa == true and Input.is_action_pressed("Presionar"):
		boton_rosa_activado = true

func _on_area_nave_2_body_entered(body: Node2D) -> void:
	if boton_rosa_activado == true and body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Escenas/Interface/menu_principal.tscn")

#-----------Codigo dfe boton y saltador verde ------------------
func _on_area_saltador_verde_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") and boton_verde_activado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE -= 4500
		$"Saltador verde/AnimatedSprite2D".play("Nave verde")
		salto_pontenciado = true

func _on_area_saltador_verde_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and salto_pontenciado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE += 4500
		$"Saltador verde/AnimatedSprite2D".stop()
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
		player[0].JUMP_FORCE -= 8500
		$"Saltador Rosa/AnimatedSprite2D".play("default")
		salto_pontenciado = true

func _on_area_saltador_rosa_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player") and salto_pontenciado == true:
		var player = get_tree().get_nodes_in_group("Player")
		player[0].JUMP_FORCE += 8500
		$"Saltador Rosa/AnimatedSprite2D".stop()
		salto_pontenciado = false
