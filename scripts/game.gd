extends Node2D

@onready var ball = $Ball
@onready var label_pongs = $Pongs
@onready var label_tutorial = $Tutorial

func _process(delta):
	if ball.started:
		label_pongs.visible = true
		label_tutorial.visible = false
	
	label_pongs.text = str(ball.pongs)

func _on_hole_body_entered(body):
	get_tree().reload_current_scene()
