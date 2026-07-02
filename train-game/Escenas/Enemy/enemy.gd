extends CharacterBody2D

#variables ready
@onready var state_machine = $StateMachine
@onready var player = get_tree().get_first_node_in_group("player")

#variables export
@export var max_healt : int = 50
@export var speed : int = 100
@export var damage : int = 15

#variables numericas
var distance_attack : float = 20.0

#variables booleanas
var can_attack = true
var chase = false
var in_attack = false

func _ready() -> void:
	for state in state_machine.get_children():
		state.entity = self
		state.state_machine = state_machine
	
	await get_tree().process_frame
	
	state_machine.change_state($StateMachine/Idle)
