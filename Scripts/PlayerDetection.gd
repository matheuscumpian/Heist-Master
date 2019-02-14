extends "res://Scripts/Character.gd"

const FOV_TOLERANCE = 22

const MAX_RANGE = 340

onready var Player = get_node("/root/Node2D/Player")

onready var Lanterna_start_color = $Lanterna.color

func _ready():



	pass

func _process(delta):
	
	Player_is_on_fov()
	
	pass
	
func Player_is_on_fov(): #Check if the player is on the security camera Field of View
	
	#Direction_to_player will receive a normalized Vector2, that represents the direction of the player in the scene
	var Direction_to_player = (Player.position - global_position).normalized() 
		
	var NPC_facing_direction = Vector2(1,0).rotated(global_rotation)
	
	if abs(Direction_to_player.angle_to(NPC_facing_direction)) < deg2rad(FOV_TOLERANCE) and Player_is_on_LOS():
		
		$Lanterna.color = Color(1,0,0,0.5)
		
	else:
		
		$Lanterna.color = Lanterna_start_color
		
	pass

func Player_is_on_LOS(): # Check if the player is on the security camera Line of Sight
	
	var space = get_world_2d().direct_space_state # Catch the world physics and store on space 
	
	#LOS_Obstacle will cast a raycast, this ray will be emitted on the player direction, and will be able to collide
	
	#with all the objects that has been setted on the collision mask of the node.
	var LOS_Obstacle = space.intersect_ray(global_position,Player.global_position,[self],collision_mask) 
	
	var distance_to_player = Player.global_position.distance_to(global_position)
	
	var player_is_in_range = distance_to_player < MAX_RANGE
	
	if LOS_Obstacle.collider == Player and player_is_in_range:
		return true
	else:
		return false
	
	
	
	
	pass
