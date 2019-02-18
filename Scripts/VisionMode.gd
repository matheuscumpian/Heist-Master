extends CanvasModulate

const DARK = Color("171340")
const NIGHT_VISION = Color("1bcf10")

var can_switch = true
var cooldown = 10
var call_cooldown = false
func _ready():
	add_to_group("interface")
	Global.visionmode = self
	color = DARK
	pass
	
	
func _process(delta):

	
	pass
func switch_signal():
	
	if color == DARK and can_switch:
		can_switch = false
		color = NIGHT_VISION
		$On_Sound.play()
		$Timer.start()
		get_tree().call_group("NPC","lanterna")


func _on_Timer_timeout():
	$Cooldown.start()
	$Off_Sownd.play()
	color = DARK
	get_tree().call_group("NPC","lanterna")
	pass 


func _on_Cooldown_timeout():
	
	can_switch = true
	
	pass # replace with function body
