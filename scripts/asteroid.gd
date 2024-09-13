extends Area2D

const ASTEROID_SPEED = 140
const ASTEROID_ROTATION_SPEED = 1.3
const VIEWPORT_WIDTH = 540

@onready var timer_delete = $TimerDelete

var start_side

func _ready():
	if (global_position.x > VIEWPORT_WIDTH):
		start_side = "right"
	else:
		start_side = "left"

func _process(delta):
	
	if (start_side == "right"):
		global_position.x -= ASTEROID_SPEED * delta
		rotation -= ASTEROID_ROTATION_SPEED * delta
	elif  (start_side == "left"):
		global_position.x += ASTEROID_SPEED * delta
		rotation += ASTEROID_ROTATION_SPEED * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	timer_delete.start()

func _on_timer_delete_timeout():
	queue_free()
