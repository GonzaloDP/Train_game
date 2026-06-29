extends Node

var current_state : State

func change_state(new_state: State):
	if current_state:
		current_state.exit()
	
	current_state = new_state
	
	if current_state:
		current_state.enter()

func _physics_process(_delta):
	if current_state:
		current_state.update(_delta)
