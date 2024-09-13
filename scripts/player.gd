extends CharacterBody2D

const SPEED = 350.0

var ball

func _ready():
	ball = get_parent().get_node("Ball")

func _physics_process(delta):
	
	velocity.x = 0
	
	if Input.is_action_pressed("ui_left") and ball.started == true:
		velocity.x -= SPEED
	if Input.is_action_pressed("ui_right") and ball.started == true:
		velocity.x += SPEED

	move_and_collide(velocity * delta)
