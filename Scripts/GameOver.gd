extends CanvasLayer



func _on_tryagain_pressed():
	
	get_tree().change_scene("res://Scenes/Levels/Test_Level.tscn")
	
	pass # replace with function body


func _on_quit_pressed():
	
	get_tree().quit()
	
	pass # replace with function body
