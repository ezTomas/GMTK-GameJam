extends RigidBody2D
@export var planet: StaticBody2D 

@onready var ray_cast_2d: RayCast2D = $RayCast2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 50
const JUMP_FORCE = -1500

func _physics_process(delta: float) -> void:
	var direction = Input.get_axis("ui_left", "ui_right")
	var force = Vector2.ZERO
	var planetaDireccion = global_position.direction_to(planet.global_position)
	
	if _on_floor() and Input.is_action_just_pressed("ui_accept"):
		force += JUMP_FORCE * planetaDireccion 
	if direction:
		force += planetaDireccion.orthogonal() * SPEED * direction
		lock_rotation = false
	else:
		lock_rotation = true
	
	var pegado_al_planeta = planetaDireccion * 50  # Podés ajustar la fuerza (ej. 50 a 100)
	apply_central_impulse(pegado_al_planeta)
	
	apply_central_impulse(force)
	
	look_at(planet.global_position)
	
	var lateral_speed = linear_velocity.dot(planetaDireccion.orthogonal())
	_set_animation(lateral_speed)

func _integrate_forces(state: PhysicsDirectBodyState2D) -> void:
	rotation_degrees = 0

func _set_animation(direction):
	if direction > 0:
		animated_sprite_2d.flip_h = true
	elif direction < 0:
		animated_sprite_2d.flip_h = false

	if abs(linear_velocity.x) > 10:
		animated_sprite_2d.play("Run")
	else:
		animated_sprite_2d.play("idle")

func _on_floor():
	if ray_cast_2d.is_colliding():
		return true
