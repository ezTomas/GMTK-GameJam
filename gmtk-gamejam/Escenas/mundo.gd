extends Node2D

@onready var muro_principal: StaticBody2D = $MuroPrincipal

var salto_pontenciado:bool = false
var jugador_dentro: bool = false
var boton_activado: bool = false
var muro_destruido: bool = false


func _process(delta: float) -> void:
	if jugador_dentro == true and Input.is_action_pressed("Presionar") and muro_destruido == false:
		muro_principal.queue_free()
		muro_destruido = true

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
		get_tree().change_scene_to_file("res://menu_principal.tscn")
