extends CanvasLayer

@onready var menupausa: Node2D = $Menu
# Called when the node enters the scene tree for the first time.


func _ready() -> void:
	menupausa.visible = false


func _process(delta: float) -> void:
	pausa()

func pausa():
	if Input.is_action_pressed("Escape"):
		get_tree().paused = true
		menupausa.visible = get_tree().paused

func _on_reanudar_pressed() -> void:
	get_tree().paused = false
	menupausa.visible = get_tree().paused

func _on_menu_principal_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Interface/menu_principal.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
