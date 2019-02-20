extends "res://Scripts/Door.gd"




func _ready():
	connect("exited",self,"on_player_exited")
	
	pass
	
	
	
func _input(event):
	
	if Input.is_action_just_pressed("door") and is_on_range and not $AnimationPlayer.is_playing():
		$CanvasLayer/Numberpad.popup_centered()
		
	pass
	
func on_player_exited():
	
	$CanvasLayer/Numberpad.hide()
	
	pass
	
