extends "res://Scripts/Character.gd"

var motion = Vector2()
enum vision_mode {DARK, NIGHT_VISION}


func _ready():
	Global.Player = self
	vision_mode = DARK
	pass


func _physics_process(delta):
	
	update_motion(delta)
	move_and_slide(motion)
	
	pass

func _input(event):
	
	if Input.is_action_just_pressed("ui_switch_vision"):
		
		switch_vision()
		
		pass
	
	
	
	pass

func update_motion(delta):
	
	look_at(get_global_mouse_position()) # Faz o node rotacionar e ficar sempre virado para o mouse
	#Clamp limita a velocidade do node e o lerp diminui a velocidade de acordo com o friction!!!!!
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
	

func switch_vision():
	
	if vision_mode == DARK:
		get_tree().call_group("interface", "switch_signal")
	elif vision_mode == NIGHT_VISION:
		get_tree().call_group("interface", "switch_signal")
	
	
	pass
















