extends "res://Scripts/PlayerDetection.gd"

var motion = Vector2()
var possible_destination = []
var path = []
var destination = Vector2()

export var walk_slowdown = 0.5
export var nav_stop_treshold = 5
onready var navigation = Global.navigation
onready var avaiable_destinations = Global.destinations


func _ready():
	add_to_group("NPC")
	possible_destination = avaiable_destinations.get_children() 
#	Possible destination vai ser um array com todos os nós
#	position2d que são as posições que os guardas podem ir
	make_path()
	
	pass
	
func _process(delta):
	
	navigate()
	
	pass
	
	
	
func navigate():
	#essa variavel guarda a distancia do personagem a até o position2d e é atualizada no deltatime
	var distance_to_destination = position.distance_to(path[0])
	
	destination = path[0]
	#o nosso personagem sempre vai se mover em direção ao primeiro position2d da lista do path
	if distance_to_destination > nav_stop_treshold:
		#enquanto não chegar no nosso gap do destino, continua se movendo
		move()
	else:
		# quando chegar proximo ao ponto que desejamos, apaga o ponto e segue pro proximo até chegar no destino final
		update_path()
	

	pass
	
	

func move():
	#look at destination faz com que o sprite do personagem sempre "olhe" para o ponto aonde ele está andando
	look_at(destination)
	#essa motion primeiro calcula a direção normalizada do boneco em relação ao ponto que lee precisa ir
	#então é multiplicada pela max_speed do script global e multiplicada pelo debuff de velocidade dos npcs
	motion = (destination - position).normalized() * (MAX_SPEED * walk_slowdown)
	#move_and_slide básico
	move_and_slide(motion)
	if is_on_wall():
		#is_on_wall é uma função da biblioteca padrão da gdscript, se eu bater em uma parede a condição é verdadeira
		#entao vamos chamar a make_path pra "destravar" o path
		make_path()
	pass

func update_path():
	if path.size() == 1:
		if $Timer.is_stopped():
			$Timer.start()
	else:
		# quando chegar no ponto desejado do path, apaga o ponto e vai pro proximo ponto
		path.remove(0)

func make_path():
	
	randomize() # Randomize faz com que cada vez que seja rodado essa função, seja gerada uma nova lista aleatória
	
	var next_destination = possible_destination[randi() % possible_destination.size()]
	#next_destination vai ser uma position2d pega aleatoriamente dentro do array de positions2d
	
	path = navigation.get_simple_path(global_position, next_destination.global_position,false)
	
	#get_simple_path vai dar um caminho para o personagem, a partir de onde ele está até o next_destination
	pass



func _on_Timer_timeout():
	
	make_path()
	
	
	pass # replace with function body

func lanterna():
	if !$Lanterna.enabled:
		$Lanterna.enabled = true
	else:
		$Lanterna.enabled = false
	pass
