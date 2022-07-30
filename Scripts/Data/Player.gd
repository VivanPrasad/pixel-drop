extends KinematicBody2D

var input_vector = Vector2.ZERO
var move_direction : Vector2

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")

const speed = 32 * 6 + 0.5
func _ready():
	pass

func _physics_process(_delta):
	input_vector = Vector2(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		).normalized()
	
	move_direction = input_vector
	
	if input_vector != Vector2.ZERO:
		animationTree.set("parameters/blend_position", input_vector)
	
	return move_and_slide(speed * move_direction)
	
