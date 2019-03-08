extends Node

var Player
var navigation
var destinations
var visionmode
var GUI
var DisguisesDisplay
func _ready():
	
	pass
	
var player_sprite = "res://GFX/PNG/Hitman 1/hitman1_stand.png"
var box_sprite = "res://GFX/PNG/Tiles/tile_129.png"
var player_occluder = "res://Scenes/Characters/CharacterOccluder.tres"
var box_occluder = "res://Scenes/Characters/BoxOccluder.tres"
var briefcase_sprite = "res://GFX/Loot/folder.png"