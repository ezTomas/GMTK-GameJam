extends Control
@onready var nivel_1: Button = $"TextureRect/MarginContainer/HBoxContainer/VBoxContainer/TextureRect/HBoxContainer/Nivel1"


@onready var nivel_2: Button = $TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2
@onready var nivel_3: Button = $TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3
@onready var nivel_4: Button = $TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4


func _process(delta: float) -> void:
	control_nivel()
	control_monedas()

func control_nivel():
	if Global.niveles <= 1:
		nivel_2.disabled = false
	
	if Global.niveles <= 2:
		nivel_3.disabled = false
	
	if Global.niveles <= 3:
		nivel_4.disabled = false

func _on_nivel_1_pressed() -> void:
	if Global.niveles >= 0:
		print(Global.niveles)
		get_tree().change_scene_to_file("res://Escenas/Objetos/mundo.tscn")

func _on_nivel_2_pressed() -> void:
	if Global.niveles >= 1:
		get_tree().change_scene_to_file("res://Escenas/Objetos/mundo_2.tscn")

func _on_nivel_3_pressed() -> void:
	if Global.niveles >= 2:
		get_tree().change_scene_to_file("res://globales/mundo_nivel3.tscn")

func _on_nivel_4_pressed() -> void:
	if Global.niveles >= 3:
		get_tree().change_scene_to_file("res://Escenas/Objetos/mundo_4.tscn")
		
func control_monedas():
	if Global.monedas_nivel_1 == 1:
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/Moneda 1".visible = true
	
	if Global.monedas_nivel_1 == 2:
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/No Moneda 2".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/Moneda 2".visible = true
	
	if Global.monedas_nivel_1 == 3: 
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/No Moneda 2".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/No Moneda 3".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/Moneda 2".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect/Nivel1/HBoxContainer2/Moneda 3".visible = true


	if Global.monedas_nivel_2 == 1:
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/Moneda 1".visible = true
	
	if Global.monedas_nivel_2 == 2:
		
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/No Moneda 2".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/Moneda 2".visible = true
	
	if Global.monedas_nivel_2 == 3: 
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/No Moneda 2".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/No Moneda 3".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/Moneda 2".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer/TextureRect2/Nivel2/HBoxContainer2/Moneda 3".visible = true
		
		
	if Global.monedas_nivel_3 == 1:
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/Moneda 1".visible = true
	
	if Global.monedas_nivel_3 == 2:
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/No Moneda 2".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/Moneda 2".visible = true
	
	if Global.monedas_nivel_3 == 3: 
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/No Moneda 2".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/No Moneda 3".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/Moneda 2".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect3/Nivel3/HBoxContainer2/Moneda 3".visible = true


	if Global.monedas_nivel_4 == 1:
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/Moneda 1".visible = true
	
	if Global.monedas_nivel_4 == 2:
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/No Moneda 2".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/Moneda 2".visible = true
	
	if Global.monedas_nivel_4 == 3: 
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/No Moneda 1".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/No Moneda 2".visible = false
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/No Moneda 3".visible = false
		
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/Moneda 1".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/Moneda 2".visible = true
		$"TextureRect/VBoxContainer/HBoxContainer2/TextureRect2/Nivel4/HBoxContainer2/Moneda 3".visible = true
	
func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Interface/menu_principal.tscn")
