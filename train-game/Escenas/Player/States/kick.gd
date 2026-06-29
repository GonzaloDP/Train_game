extends State

var fight_time = 0.0

func enter():
	entity.kick_attack = true
	entity.damage_change()
	if fight_time <= 0:
		fight_time = 0.4

func update(_delta):
	if Input.is_action_just_pressed("kick") and entity.can_attack:
		entity.get_node("Ataque").get_child(0).disabled = false
		entity.can_attack = false
		$"../../AnimatedSprite2D".play("kick")
	
	fight_time -= _delta
	
	if fight_time <= 0:
		entity.get_node("Ataque").get_child(0).disabled = true
		entity.can_attack = true
		entity.kick_attack = false
		get_parent().change_state(get_parent().get_node("Idle"))
	
