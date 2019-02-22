extends Popup

var combination = []
var password = []
onready var display = $VSplitContainer/DisplayContaienr/Display
var lightGreen = "res://GFX/Interface/PNG/dotGreen.png"
var lightRed = "res://GFX/Interface/PNG/dotRed.png"
var buttonSound = "res://SFX/twoTone1.ogg"
var enterSound = "res://SFX/threeTone1.ogg"
signal correct_password
func _ready():
	connect_buttons()
	reset_lock()
	setLight(lightRed)
	set_sound(buttonSound)
	pass

func connect_buttons():
	for child in $VSplitContainer/ButtonContainer/ButtonGrid.get_children():
		if child is Button:
			child.connect("pressed", self, "_on_Button_pressed", [child.text])
	pass

func _on_Button_pressed(button):
	if button == "Ok":
		check_password()
		pass
	else:
		enter(int(button))
	pass
	
func check_password():
	if password == combination:
		setLight(lightGreen)
		$Timer.start()
		set_sound(enterSound)
		$AudioStreamPlayer.play()
		pass
	else:
		reset_lock()
		$AudioStreamPlayer.play()
		
func enter(button):
	password.append(button)
	$AudioStreamPlayer.play()
	update_display()
	
	pass
	
func reset_lock():
	
	display.clear()
	password.clear()
	
	pass
	
func update_display():
	
	display.bbcode_text = "[center]" + PoolStringArray(password).join("") + "[/center]"
	
	
	pass
	
	
func setLight(light):
	$VSplitContainer/ButtonContainer/ButtonGrid/TextureRect.texture = load(light)

		
	pass



func _on_Timer_timeout():
	emit_signal("correct_password")
	set_sound(buttonSound)
	hide()
	reset_lock()
	pass


func set_sound(sound):
	
	$AudioStreamPlayer.stream = load(sound)
	
	pass
