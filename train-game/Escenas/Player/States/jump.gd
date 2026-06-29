extends State

@export var jumping_power := 50.0
@export var gravedad := 9.8

var jump_time := 0.0
var fall_time := 0.0

func enter():
	$"../../AnimatedSprite2D".play("jump")
	
	jump_time = 0.2
	fall_time = 0.24

func update(_delta):
	if Input.is_action_just_pressed("saltar") and entity.in_floor:
		entity.in_floor = false
		entity.velocity.y -= jumping_power
	
	jump_time -= _delta
	
	if jump_time <= 0:
		fall_time -= _delta
		entity.velocity.y += gravedad
		if fall_time <= 0:
			entity.velocity = Vector2.ZERO
			state_machine.change_state(state_machine.get_node("Idle"))
	
func exit():
	entity.in_floor = true
