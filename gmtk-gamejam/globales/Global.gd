extends Node

var niveles = 0

var monedas_nivel_1 = 0
var monedas_nivel_2 = 0
var monedas_nivel_3 = 0
var monedas_nivel_4 = 0


const Savefile = "user://SavePlanetLoop.save"


func _ready() -> void:
	load_data()
	print(monedas_nivel_1)
	print(monedas_nivel_2)
	print(monedas_nivel_3)
	print(monedas_nivel_4)
	print(niveles)

func load_data():
	var file = FileAccess.open(Savefile, FileAccess.READ)
	print(monedas_nivel_1)
	if file == null:
		save_data()
	else:
		niveles = file.get_var()
		monedas_nivel_1 = file.get_var()
		monedas_nivel_2 = file.get_var()
		monedas_nivel_3 = file.get_var()
		monedas_nivel_4 = file.get_var()
	save_data()
	file = null

func save_data():
	var file = FileAccess.open(Savefile, FileAccess.WRITE)
	file.store_var(niveles)
	file.store_var(monedas_nivel_1)
	file.store_var(monedas_nivel_2)
	file.store_var(monedas_nivel_3)
	file.store_var(monedas_nivel_4)

	file = null
