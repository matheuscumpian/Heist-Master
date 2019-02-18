extends Area2D

var is_on_range = false

func _on_Door_body_entered(body):
	if body != Global.Player and not $AnimationPlayer.is_playing():
		open()
	else:
		is_on_range = true
	
	
	pass


func _on_Door_body_exited(body):
	
	
	
	pass


func open():
	
	$AnimationPlayer.play("door")
	
	pass