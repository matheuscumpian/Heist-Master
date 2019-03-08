extends ItemList

func _init():
	Global.DisguisesDisplay = self





func update_disguises(number):
	clear()
	print("chamou")
	for i in range(number):
		
		add_icon_item(load(Global.box_sprite),false)
		
		pass
	pass