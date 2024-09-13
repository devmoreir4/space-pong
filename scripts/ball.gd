extends CharacterBody2D

var started = false
var start_speed = 500
const INCREMENTAL_SPEED = 1.01
var angle = [-250, 250]

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept") and started == false:
		start_game()
	
	if started:
		var collision = move_and_collide(velocity * delta)
		if collision != null:
			velocity = velocity.bounce(collision.get_normal()) * INCREMENTAL_SPEED

func start_game():
	started = true
	velocity.y = -start_speed
	velocity.x = angle.pick_random()
