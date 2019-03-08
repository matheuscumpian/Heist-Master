extends TextureProgress

var suspeita = 0 
export var contagem_de_suspeita = 1 # de quanto em quanto o nível de suspeita vai aumentar
export var eliminar_suspeita = 0.25 # de quanto em quanto o nível de suspeita vai cair

func _process(delta):
	
	player_invisivel()
	
	pass



func player_sendo_visto():
	if suspeita > 100:
		return
	suspeita += contagem_de_suspeita
	
	
func player_invisivel():
	if suspeita < 0 :
		return
	suspeita -= eliminar_suspeita
	value = suspeita
	if suspeita == 100:
		end_game()
	pass
	
	
func end_game():
	
	get_tree().change_scene("res://Scenes/GameOverScreen.tscn")
	
	
	pass