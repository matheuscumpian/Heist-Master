extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	add_to_group("NPC")
	pass

func lanterna():
	if !$CameraBody/Lanterna.enabled:
		$CameraBody/Lanterna.enabled = true
	else:
		$CameraBody/Lanterna.enabled = false
	pass