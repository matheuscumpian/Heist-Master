extends "res://Scripts/Door.gd"


var combination = [4,1,5]

func _ready():
	connect("exited",self,"on_player_exited")
	setTypeOfDoor()
	$Label.rect_rotation = -rad2deg(global_rotation)
	add_to_group("label")
	pass
	
	
	
func _input(event):
	
	if Input.is_action_just_pressed("door") and is_on_range and not $AnimationPlayer.is_playing():
		$CanvasLayer/Numberpad.popup_centered()
		
	pass
	
func on_player_exited():
	
	$CanvasLayer/Numberpad.hide()
	
	pass

	


func _on_Numberpad_correct_password():
	open()
	pass 


func _on_Computer_combination(combination, lock_group):
	self.combination = combination
	$CanvasLayer/Numberpad.combination = combination
	$Label.text = lock_group
	pass
func hide_label():
	
	if $Label.visible:
		$Label.visible = false
	elif !$Label.visible:
		$Label.visible = true
	
	pass

