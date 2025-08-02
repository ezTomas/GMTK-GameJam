extends Sprite2D

@export var radius: float = 650.0  
@export var speed: float = 1.0   

var angle: float = 0.0
var planet: Node2D

func _ready():
	planet = get_node("/root/Mundo2/Planet")

func _process(delta):

	if planet:
		angle += speed * delta
		var planet_pos = planet.global_position
		position.x = planet_pos.x + cos(angle) * radius
		position.y = planet_pos.y + sin(angle) * radius
		
		
		rotation = (planet_pos - position).angle()
