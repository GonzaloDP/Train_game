extends State

func update(_delta):
	var direction = Input.get_vector("izquierda","derecha","arriba","abajo")
	entity.velocity = direction * entity.speed
	
	if direction == Vector2.ZERO:
		get_parent().change_state(get_parent().get_node("Idle"))
	
	if direction.x > 0:
		entity.get_node("Ataque").get_child(0).position.x = 10.0
		$"../../AnimatedSprite2D".flip_h = false
		$"../../AnimatedSprite2D".play("walk")
	elif direction.x < 0:
		entity.get_node("Ataque").get_child(0).position.x = -10.0
		$"../../AnimatedSprite2D".flip_h = true
		$"../../AnimatedSprite2D".play("walk")
