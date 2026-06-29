extends State

var fight_time = 0.0

var punch_1 = false
var punch_2 = false

func enter():
	entity.punch_attack = true
	entity.damage_change()
	if fight_time <= 0:
		fight_time = 0.4

func update(_delta):
	if Input.is_action_just_pressed("punch") and entity.can_attack:
		entity.get_node("Ataque").get_child(0).disabled = false
		entity.can_attack = false
		actualizador()
	
	fight_time -= _delta
	
	if fight_time <= 0:
		entity.get_node("Ataque").get_child(0).disabled = true
		entity.can_attack = true
		entity.punch_attack = false
		get_parent().change_state(get_parent().get_node("Idle"))

func actualizador():
	if punch_1:
		punch_1 = false
		punch_2 = true
		$"../../AnimatedSprite2D".play("punch_2")
		return
	
	punch_1 = true
	$"../../AnimatedSprite2D".play("punch_1")
	return
