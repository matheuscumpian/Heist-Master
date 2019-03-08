extends Area2D

var combination
var can_click = false
signal combination
export var lock_group = "Unset"
func _ready():
	
	$Light2D.enabled = false
	generate_combination()
	emit_signal("combination",combination,lock_group)
	$Label.rect_rotation = -rad2deg(global_rotation)
	$Label.text = lock_group
	add_to_group("label")
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

func hide_label():
	
	if $Label.visible:
		$Label.visible = false
	elif !$Label.visible:
		$Label.visible = true
	
	pass





