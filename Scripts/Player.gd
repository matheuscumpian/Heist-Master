extends "res://Scripts/Character.gd"

var move = Vector2()

func _ready():




	pass

func _process(delta):	
	
	if Input.is_action_pressed("ui_up") and not Input.is_action_pressed("ui_down") :
		move += Vector2(0,-1)
	if Input.is_action_pressed("ui_down") and not Input.is_action_pressed("ui_up"):
		move += Vector2(0,1)
	if Input.is_action_pressed("ui_left") and not Input.is_action_pressed("ui_right"):
		move += Vector2(-1,0)
	if Input.is_action_pressed("ui_right") and not Input.is_action_pressed("ui_left"):
		move += Vector2(1,0)
		
	move_and_slide(move)
	
	
	
	pass
