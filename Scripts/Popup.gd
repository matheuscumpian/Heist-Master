extends Popup

func _ready():
	pass


func set_text(combination):
	
	
	$RichTextLabel.bbcode_text = "[center]" + "Geramos uma nova senha para voce: {" + PoolStringArray(combination).join("") + "}. Mas tente nao se esquecer dessa vez" + "[/center]"
	
	
	pass