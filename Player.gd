extends KinematicBody2D

var speed = 200
var jump = 400
var graviti = 700
var vel = Vector2()
var jump_max = 2
var jump_count = 0
func _physics_process(delta):
	
	if Input.is_action_pressed("ui_right"):
		vel.x = speed
	elif Input.is_action_pressed("ui_left"):
		vel.x = -speed
	else:
		vel.x = 0
	if is_on_floor() or is_on_wall() and jump_count != 0:
		jump_count = 0
	if jump_count<jump_max:
		if Input.is_action_just_pressed("ui_up"):
			vel.y = -jump
			jump_count += 1
	vel.y += graviti * delta
	vel = move_and_slide(vel, Vector2.UP)


func _on_Area2D_body_entered(body):
	get_tree().reload_current_scene()
