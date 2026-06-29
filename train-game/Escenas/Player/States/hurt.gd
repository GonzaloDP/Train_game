extends State

var hurt_time = 0.0

func enter():
	if hurt_time <= 0:
		hurt_time = 0.6
	$"../../AnimatedSprite2D".play("hurt")

func update(_delta):
	hurt_time -= _delta
	
	if hurt_time <= 0:
		get_parent().change_state(get_parent().get_node("Idle"))
