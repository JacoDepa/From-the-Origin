extends Node

onready var hut = 0
onready var pop = 0
onready var food = 0
onready var wood = 0
onready var stone = 0
onready var nwood = 50
onready var flag = 0
onready var lumberjack = 0
onready var stone_gatherer = 0
onready var timer = null
onready var delay = 10
onready var can_gather = true
onready var lumberjack_plus = get_node("lumberjack+")
onready var lumbrjack_min = get_node("lumberjack-")
onready var stone_gatherer_plus = get_node("stone_gatherer+")
onready var stone_gatherer_min = get_node("stone_gatherer-")

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	lumberjack_plus.visible = false
	lumbrjack_min.visible = false
	stone_gatherer_plus.visible = false
	stone_gatherer_min.visible = false
	pass


func on_timeout_complete():
	can_gather = true
	auto_gather()

func _on_gather_wood_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
	pass # Replace with function body.


func _on_gather_stone_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			stone += 1
	pass # Replace with function body.


func _on_build_hut_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if wood >= nwood:
				hut += 1
				pop += 4
				wood -= nwood
				flag = 1
				
	if hut >= 1 and flag == 1:
		flag = 0
		nwood += 50
		
	if hut > 0:
		lumberjack_plus.visible = true
		lumbrjack_min.visible = true
		stone_gatherer_plus.visible = true
		stone_gatherer_min.visible = true
	pass # Replace with function body.


func _on_gather_food_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			food += 1
	pass # Replace with function body.


func _on_lumberjack_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if pop > 0:
				lumberjack += 1
				pop -= 1
				get_node("nlumberjack").text = str("lumberjack: ",lumberjack)
				get_node("npopulation").text = str("population: ", pop)
	pass # Replace with function body.


func _on_lumberjack_min_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if lumberjack > 0:
				lumberjack -= 1
				pop += 1
				get_node("nlumberjack").text = str("lumberjack: ",lumberjack)
				get_node("npopulation").text = str("population: ", pop)
	pass # Replace with function body.


func _on_stone_gatherer_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if pop > 0:
				stone_gatherer += 1
				pop -= 1
				get_node("nstone_gatherer").text = str("stone gatherer: ",stone_gatherer)
				get_node("npopulation").text = str("population: ", pop)
	pass # Replace with function body.


func _on_stone_gatherer_min_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if stone_gatherer > 0:
				stone_gatherer -= 1
				pop += 1
				get_node("nstone_gatherer").text = str("stone gatherer: ",stone_gatherer)
				get_node("npopulation").text = str("population: ", pop)
	pass # Replace with function body.

func auto_gather():
	if lumberjack >= 1:
		#print(can_gather)
		if can_gather == true:
			#print("ok")
			wood += (2*lumberjack)
			can_gather = false
			timer.start()
			#print(timer.get_time_left())
			get_node("/root/Node/nwood").text = str("wood: ", wood)
		else:
			pass
	else:
		pass
		
	if stone_gatherer >= 1:
		#print(can_gather)
		if can_gather == true:
			#print("ok")
			stone += (2*stone_gatherer)
			can_gather = false
			timer.start()
			#print(timer.get_time_left())
			get_node("/root/Node/nstone").text = str("stone: ", stone)
		else:
			pass
	else:
		pass