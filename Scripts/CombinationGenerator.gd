extends Node


export (int) var lenght = 0



func combination_generator():
	randomize()
	var combination = []
	lenght = randi() % 7 + 2 
	for number in range(lenght):
		randomize()
		combination.append(randi() % 10)
		pass
	return combination
