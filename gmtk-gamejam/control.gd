extends CanvasLayer
var menu_pausa = null

func _on_button_pressed() -> void:
	if menu_pausa:
		menu_pausa.mostrar_menu()
	queue_free()
