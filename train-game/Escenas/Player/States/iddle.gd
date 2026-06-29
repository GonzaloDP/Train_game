extends State

func enter():
	entity.velocity = Vector2.ZERO
	
	$"../../AnimatedSprite2D".play("iddle")

func update(_delta):
	var direction = Input.get_vector("izquierda","derecha","arriba","abajo")
	var parent = get_parent()
	
	if direction != Vector2.ZERO:
		parent.change_state(parent.get_node("Move"))
