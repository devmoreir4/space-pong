extends CharacterBody2D

const INCREMENTAL_SPEED = 1.02
const MAX_SPEED = 1500

var started = false
var start_speed = 500
var angle = [-250, 250]
var pongs = 0

func _physics_process(delta):
	if Input.is_action_pressed("ui_accept") and started == false:
		start_game()
	
	if started:
		var collision = move_and_collide(velocity * delta)
		if collision != null:
			if collision.get_collider().name == "TopWall":
				if(velocity.length() > MAX_SPEED):
					pongs += 1
					velocity = velocity.bounce(collision.get_normal())
				else:
					pongs += 1
					velocity = velocity.bounce(collision.get_normal()) * INCREMENTAL_SPEED
			else:
				velocity = velocity.bounce(collision.get_normal())

func start_game():
	started = true
	velocity.y = -start_speed
	velocity.x = angle.pick_random()
