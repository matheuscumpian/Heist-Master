extends Area2D

var is_on_range = false
signal exited
var isWoodenDoor = true
func _ready():
	
	
	
	pass
func _on_Door_body_entered(body):
	if body != Global.Player and not $AnimationPlayer.is_playing():
		open()
	else:
		is_on_range = true
	
	
	pass


func _on_Door_body_exited(body):
	if body == Global.Player:
		is_on_range = false
		emit_signal("exited")
	
	pass


func _input(event):
	
	if Input.is_action_just_pressed("door") and is_on_range and not $AnimationPlayer.is_playing() and isWoodenDoor:
		open()
		
	
	
	pass

func open():
	
	$AnimationPlayer.play("door")
	
	pass
	
func setTypeOfDoor():
	
	isWoodenDoor = false
	
	
	pass