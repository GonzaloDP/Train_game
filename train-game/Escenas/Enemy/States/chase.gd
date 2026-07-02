extends State

func enter():
	entity.chase = true

func update(_delta):
	var player = entity.player
	
	if player.die:
		return
	else:
		var distance = entity.global_position.distance_to(player.global_position)
		
		if distance <= entity.distance_attack:
			entity.chase = false
			entity.velocity = Vector2.ZERO
			entity.state_machine.change_state($"../Punch")
			
			return
		
		var direction = player.global_position - entity.global_position
		direction = direction.normalized()
		
		entity.velocity = direction * entity.speed
	
	entity.move_and_slide()
	walk_update()

func exit():
	$"../../Bruto".stop()

func walk_update():
	var player = entity.player
	
	var direction = player.global_position - entity.global_position
	direction = direction.normalized()
	
	if direction.x > 0:
		$"../../Bruto".flip_h = false
		$"../../Bruto".play("Walk")
	elif direction.x < 0:
		$"../../Bruto".flip_h = true
		$"../../Bruto".play("Walk")
