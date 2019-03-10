extends Node2D

var text

func _ready():

	update_pointer_position(0)
	$TutorialGui/Popup.show()
	text = read_json()
	pass


func read_json():
	
	var file = File.new()
	file.open(Global.text_file,File.READ)
	var content = file.get_as_text()
	file.close()
	
	return parse_json(content)
	
	



func update_pointer_position(number):
	
	var pointer = $ObjectivePointer
	var marker = $ObjectiveMarkers.get_child(number)
	pointer.position = marker.position
	$Tween.interpolate_property($ObjectivePointer,"position",$ObjectivePointer.position,marker.position,0.5,Tween.TRANS_EXPO,Tween.EASE_IN)
	$Tween.start()
	$AudioStreamPlayer.play()
	$TutorialGui/Popup/Label.text = text[str(number)]
	pass


func _on_FirstDoor_body_entered(body):
	
	update_pointer_position(1)
	
	pass 


func _on_Computer_body_entered(body):
	
	update_pointer_position(2)
	
	pass 




func _on_LockedDoor_body_entered(body):
	
	update_pointer_position(3)
	
	pass 
