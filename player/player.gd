extends CharacterBody2D

const speed = 70
var inputDirection: get = getInputDirection
var spriteDirection

@onready var sprite = $AnimatedSprite2D

func _physics_process(_delta):
	velocity = inputDirection * speed
	move_and_slide()


func getInputDirection():
	var x = -int(Input.is_action_pressed("ui_left")) + int(Input.is_action_pressed("ui_right"))
	var y = -int(Input.is_action_pressed("ui_up")) + int(Input.is_action_pressed("ui_down"))
	inputDirection = Vector2(x,y).normalized()
	return inputDirection
	



