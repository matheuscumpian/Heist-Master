extends Area2D

var combination
var can_click = false

func _ready():
	
	$Light2D.enabled = false
	generate_combination()
	pass

func generate_combination():
	
	var combination_generator = get_tree().get_root().find_node("CombinationGenerator",true,false)
	combination = combination_generator.combination_generator()
	set_popup_text()
	pass

func _input(event):
	if Input.is_action_just_pressed("door") and can_click:
		
		$ComputerPopup/Popup.popup_centered()
		$Light2D.enabled = true
		

func _on_Computer_body_entered(body):
	
	
	can_click = true
	
	pass


func _on_Computer_body_exited(body):
	
	can_click = false
	$Light2D.enabled = false
	pass


func set_popup_text():
	
	
	$ComputerPopup/Popup.set_text(combination)
	
	
	pass






