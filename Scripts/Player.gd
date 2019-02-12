extends "res://Scripts/Character.gd"

var motion = Vector2()

func _ready():
	Global.Player = self
	pass


func _physics_process(delta):
	
	update_motion(delta)
	move_and_slide(motion)
	
	pass

func update_motion(delta):
	
	look_at(get_global_mouse_position()) # Faz o node rotacionar e ficar sempre virado para o mouse
	
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down"):
		motion.y = clamp((motion.y - SPEED), -MAX_SPEED , 0)
	elif Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		motion.y = clamp((motion.y + SPEED), 0 , MAX_SPEED)
	else:
		motion.y = lerp(motion.y, 0 , FRICTION)
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		motion.x = clamp((motion.x - SPEED), -MAX_SPEED , 0)
	elif Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		motion.x = clamp((motion.x + SPEED), 0 , MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0 , FRICTION)
	pass
	




#func ligar_lanterna():
#
#	if Input.is_action_just_pressed("toggle_flashlight"):
#		if !$Lanterna.enabled == false:
#
#			$Lanterna.enabled = false
#		else:
#			$Lanterna.enabled = true
#	pass

