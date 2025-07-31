extends Control

func _ready() -> void:
	get_tree().paused = false

func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://mundo.tscn")

func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://creditos.tscn")

func _on_salir_pressed() -> void:
	get_tree().quit()
