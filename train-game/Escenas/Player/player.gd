extends CharacterBody2D

#variables ready
@onready var state_machine = $StateMachine

#variables export
@export var max_health : int = 100
@export var speed : int = 150
@export var fist_damage : int = 10
@export var kick_damage : int = 15

#variables numericas
var damage : int

#variables booleanas
var in_floor = true
var can_attack = true
var punch_attack = false
var kick_attack = false
var die = false

#funciones
func _ready() -> void:
	for state in state_machine.get_children():
		state.entity = self
		state.state_machine = state_machine
	
	await get_tree().process_frame
	
	state_machine.change_state($StateMachine/Idle)

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("saltar") and in_floor:
		state_machine.change_state($StateMachine/Jump)
	elif Input.is_action_just_pressed("punch"):
		state_machine.change_state($StateMachine/Punch)
	elif Input.is_action_just_pressed("kick"):
		state_machine.change_state($StateMachine/Kick)
	elif Input.is_action_just_pressed("daño prueba"):
		state_machine.change_state($StateMachine/Hurt)
	
	move_and_slide()

func _on_ataque_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemy"):
		body.take_damage(damage_change())

func damage_change() -> int:
	if punch_attack:
		damage = fist_damage
		return damage
	elif kick_attack:
		damage = kick_damage
		return damage
	else:
		return damage
