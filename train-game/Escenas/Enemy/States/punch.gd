extends State

var attack_cooldown = 0.0
var time_animation = 0.0

func enter():
	entity.in_attack = true
	
	if attack_cooldown <= 0:
		attack_cooldown = 1.2
		if time_animation <= 0:
			time_animation = 0.8

func update(_delta):
	if entity.can_attack:
		if time_animation > 0:
			$"../../Bruto".play("Punch")
			entity.can_attack = false
	
	attack_cooldown -= _delta
	time_animation -= _delta
	
	if attack_cooldown <= 0:
		get_parent().change_state(get_parent().get_node("Chase"))
	if time_animation <= 0:
		$"../../Bruto".play("Idle")

func exit():
	entity.in_attack = false
	entity.can_attack = true
