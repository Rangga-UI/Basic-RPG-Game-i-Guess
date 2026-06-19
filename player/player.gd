extends CharacterBody2D

const SPEED = 100.0

var input_vector: = Vector2.ZERO

@onready var animation_tree: AnimationTree = $AnimationTree

func _physics_process(delta: float) -> void:
	
	input_vector = Input.get_vector("ui_left", "ui_right","ui_up","ui_down")
	
	if input_vector != Vector2.ZERO:
		var dir_vector = Vector2(input_vector.x, -input_vector.y)
		update_blend_position(dir_vector)
	
	velocity = input_vector * SPEED
	move_and_slide()

func update_blend_position(dir_vector: Vector2) -> void:
	animation_tree.set("parameters/StateMachine/MoveState/RunState/blend_position", dir_vector)
	animation_tree.set("parameters/StateMachine/MoveState/StandState/blend_position", dir_vector)
