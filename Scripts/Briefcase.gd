extends Area2D



func _on_Briefcase_body_entered(body):
	
	Global.Player.collect_briefcase()
	queue_free()
	
	pass # replace with function body
