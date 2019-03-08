extends CanvasLayer



func _ready():
	Global.GUI = self
	pass

func collect_loot():
	
	$LootContainer.collect_loot()
	
	pass