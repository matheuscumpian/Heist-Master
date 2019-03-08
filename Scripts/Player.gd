extends "res://Scripts/Character.gd"

var motion = Vector2()
enum vision_mode {DARK, NIGHT_VISION}
var disguised = false
export var disguises = 3
export var disguise_duration = 5
export var disguise_slowdown = 0.25
var velocity_multiplier = 1 




func _ready():
	Global.Player = self
	vision_mode = DARK
	$Timer.wait_time = disguise_duration
	reveal()
	
	pass
	
	
func _process(delta):
	if disguised:
		$Label.rect_rotation = -rotation_degrees
		$Label.text = str($Timer.time_left).pad_decimals(2)
	pass


func _physics_process(delta):
	
	update_motion(delta)
	move_and_slide(motion * velocity_multiplier)
	
	pass

func _input(event):
	
	if Input.is_action_just_pressed("ui_switch_vision"):
		
		switch_vision()
		
		pass
	
	if Input.is_action_just_pressed("toggle_disguise"):
		
		toggle_disguise()
		
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

func disguise():
	$Label.visible = true
	$Sprite.texture = load(Global.box_sprite)
	$Light2D.texture = load(Global.box_sprite)
	$LightOccluder2D.occluder = load(Global.box_occluder)
	velocity_multiplier = disguise_slowdown
	disguises -= 1
	$Timer.start()
	disguised = true
	pass

func reveal():
	Global.DisguisesDisplay.update_disguises(disguises)
	$Label.visible = false
	$Sprite.texture = load(Global.player_sprite)
	$Light2D.texture = load(Global.player_sprite)
	$LightOccluder2D.occluder = load(Global.player_occluder)
	velocity_multiplier = 1
	disguised = false
	pass

func toggle_disguise():
	
	if disguised:
		reveal()
	elif disguises > 0:
		disguise()
	pass

func collect_briefcase():
	var loot = Node.new()
	loot.set_name("briefcase")
	add_child(loot)
	Global.GUI.collect_loot()
	pass
