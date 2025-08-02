extends Sprite2D

@export var radius: float = 650.0  # Distancia al planeta
@export var speed: float = 1.0     # Velocidad de la órbita (radianes por segundo)

var angle: float = 0.0
var planet: Node2D
var rotation_speed_degrees = .1

func _ready():
	planet = get_node("/root/Mundo/Planet")  # Ruta absoluta al nodo Planet
	# Alternativamente, si estás seguro de que Planet está en el mismo nivel:
	# planet = get_parent().get_node("../Planet")

func _process(delta):
	if planet:
		angle += speed * delta
		var planet_pos = planet.global_position
		position.x = planet_pos.x + cos(angle) * radius
		position.y = planet_pos.y + sin(angle) * radius
		
		
		rotation = (planet_pos - position).angle()
