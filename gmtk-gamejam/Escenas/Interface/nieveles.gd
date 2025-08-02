extends Control
@onready var nivel_1: Button = $ColorRect/HBoxContainer/Nivel1
@onready var nivel_2: Button = $ColorRect/HBoxContainer/Nivel2
@onready var nivel_3: Button = $ColorRect/HBoxContainer/Nivel3

func _ready() -> void:
	nivel_2.disabled = true
	nivel_3.disabled = true

func _process(delta: float) -> void:
	control_nivel()
	control_monedas()

func control_nivel():
	if Global.niveles == 1:
		nivel_2.disabled = false
	
	if Global.niveles == 2:
		nivel_3.disabled = false

func _on_nivel_1_pressed() -> void:
	if Global.niveles == 0:
		get_tree().change_scene_to_file("res://Escenas/mundo.tscn")

func _on_nivel_2_pressed() -> void:
	if Global.niveles == 1:
		get_tree().change_scene_to_file("res://Escenas/mundo_2.tscn")

func _on_nivel_3_pressed() -> void:
	if Global.niveles == 2:
		get_tree().change_scene_to_file("res://Escenas/mundo_3.tscn")

func control_monedas():
	if Global.monedas_nivel_1 == 1:
		$"ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/Nivel1-Moneda".visible = true
	
	if Global.monedas_nivel_1 == 2:
		$"ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/Nivel1-Moneda".visible = true
		$"ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/Nivel1-Moneda2".visible = true
	
	if Global.monedas_nivel_1 == 3: 
		$"ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/Nivel1-Moneda".visible = true
		$"ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/Nivel1-Moneda2".visible = true
		$"ColorRect/HBoxContainer/VBoxContainer/HBoxContainer/Nivel1-Moneda3".visible = true
