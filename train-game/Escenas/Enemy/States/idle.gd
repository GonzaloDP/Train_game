extends State

func enter():
	var player = entity.player

func update(_delta):
	$"../../Bruto".play("Idle")
	
	pass


func _on_chase_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_parent().change_state(get_parent().get_node("Chase"))
	pass
