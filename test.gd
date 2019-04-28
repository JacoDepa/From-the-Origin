extends Node

#Goods
onready var hut = 0
onready var pop = 0
onready var food = 0
onready var wood = 0
onready var stone = 0
onready var nwood = 50
onready var flag = 0
onready var lumberjack = 0
onready var stone_gatherer = 0
onready var farmer = 0

#Timer
onready var timerWood = null
onready var timerStone = null
onready var timerFood = null
onready var delay = 10
onready var can_gather_wood = true
onready var can_gather_stone = true
onready var can_gather_food = true

#Buttons
onready var gather_stone = get_node("gather_stone")
onready var build_hut = get_node("build_hut")
onready var gather_food = get_node("gather_food")


#lumberjack
onready var lumberjack_plus = get_node("lumberjack+")
onready var lumbrjack_min = get_node("lumberjack-")
onready var nlumberjack = get_node("nlumberjack")

#dtone gatherer
onready var stone_gatherer_plus = get_node("stone_gatherer+")
onready var stone_gatherer_min = get_node("stone_gatherer-")
onready var nstone_gatherer = get_node("nstone_gatherer")

#framer
onready var farmer_plus = get_node("farmer+")
onready var farmer_min = get_node("farmer-")
onready var nfarmer = get_node("nfarmer")


func _ready():
	
	#auto gather wood timer
	timerWood = Timer.new()
	timerWood.set_one_shot(true)
	timerWood.set_wait_time(delay)
	timerWood.connect("timeout", self, "on_timeout_complete_wood")
	add_child(timerWood)
	
	#auto gather stone timer
	timerStone = Timer.new()
	timerStone.set_one_shot(true)
	timerStone.set_wait_time(delay)
	timerStone.connect("timeout", self, "on_timeout_complete_stone")
	add_child(timerStone)
	
	#auto gather food timer
	timerFood = Timer.new()
	timerFood.set_one_shot(true)
	timerFood.set_wait_time(delay)
	timerFood.connect("timeout", self, "on_timeout_complete_food")
	add_child(timerFood)
	
	#makes works and workes num non visible
	lumberjack_plus.visible = false
	lumbrjack_min.visible = false
	nlumberjack.visible = false
	stone_gatherer_plus.visible = false
	stone_gatherer_min.visible = false
	nstone_gatherer.visible = false
	farmer_plus.visible = false
	farmer_min.visible = false
	nfarmer.visible = false
	
	#make buttons non visibles
	gather_stone.visible = false
	gather_food.visible = false
	build_hut.visible = false
	
	pass


#activate wood auto gather
func on_timeout_complete_wood():
	#activate wood auto gather
	can_gather_wood = true
	auto_gather_wood()


#activate stone auto gather
func on_timeout_complete_stone():
	#activate stone auto gather
	can_gather_stone = true
	auto_gather_stone()


#activate food auto gather
func on_timeout_complete_food():
	#activate food auto gather
	can_gather_food = true
	auto_gather_food()



#gather wood
func _on_gather_wood_input_event(viewport, event, shape_idx):
	#gather wood
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
			get_node("nwood").text = str("wood: ", wood)
	
	#make "gather_stone" visible when wood >= 20
	if wood >= 20:
		gather_stone.visible = true
	pass # Replace with function body.



#gather stone
func _on_gather_stone_input_event(viewport, event, shape_idx):
	#gather stone
	if event is InputEvent:
		if event.is_pressed():
			stone += 1
			get_node("nstone").text = str("stone: ", stone)
	
	pass # Replace with function body.



#buld hut if you have enough wood
func _on_build_hut_input_event(viewport, event, shape_idx):
	#buld hut if you have enough wood
	if event is InputEvent:
		if event.is_pressed():
			if wood >= nwood:
				hut += 1
				pop += 4
				wood -= nwood
				flag = 1
				get_node("nhut").text = str("hut: ", hut)
				get_node("npopulation").text = str("population: ", pop)
				get_node("nwood").text = str("wood: ", wood)
	
	if hut >= 1 and flag == 1:
		#augment wood neccessary to build hut
		flag = 0
		nwood += 50
		get_node("/root/Node/build_hut/Label").text = str("build hut (",nwood," wood)")
		
	if hut > 0:
		#makes works and workers num visible
		lumberjack_plus.visible = true
		lumbrjack_min.visible = true
		nlumberjack.visible = true
		stone_gatherer_plus.visible = true
		stone_gatherer_min.visible = true
		nstone_gatherer.visible = true
		farmer_plus.visible = true
		farmer_min.visible = true
		nfarmer.visible = true
		
		#makes buttons visibles
		gather_food.visible = true
		build_hut.visible = true
	
	pass # Replace with function body.



#gather food
func _on_gather_food_input_event(viewport, event, shape_idx):
	#gather food
	if event is InputEvent:
		if event.is_pressed():
			food += 1
			get_node("nfood").text = str("food: ", food)
	
	pass # Replace with function body.



#augment lumberjack num
func _on_lumberjack_input_event(viewport, event, shape_idx):
	#augment lumberjack num
	if event is InputEvent:
		if event.is_pressed():
			if pop > 0:
				lumberjack += 1
				pop -= 1
				get_node("nlumberjack").text = str("lumberjack: ",lumberjack)
				get_node("npopulation").text = str("population: ", pop)
		
		auto_gather_wood()
	pass # Replace with function body.



#decrease lumberjack num
func _on_lumberjack_min_input_event(viewport, event, shape_idx):
	#decrease lumberjack num
	if event is InputEvent:
		if event.is_pressed():
			if lumberjack > 0:
				lumberjack -= 1
				pop += 1
				get_node("nlumberjack").text = str("lumberjack: ",lumberjack)
				get_node("npopulation").text = str("population: ", pop)
	pass # Replace with function body.



#increase stone gatherer num
func _on_stone_gatherer_input_event(viewport, event, shape_idx):
	#increase stone gatherer num
	if event is InputEvent:
		if event.is_pressed():
			if pop > 0:
				stone_gatherer += 1
				pop -= 1
				get_node("nstone_gatherer").text = str("stone gatherer: ",stone_gatherer)
				get_node("npopulation").text = str("population: ", pop)
		auto_gather_stone()
	pass # Replace with function body.



#decrease dtone gatherer num
func _on_stone_gatherer_min_input_event(viewport, event, shape_idx):
	#decrease dtone gatherer num
	if event is InputEvent:
		if event.is_pressed():
			if stone_gatherer > 0:
				stone_gatherer -= 1
				pop += 1
				get_node("nstone_gatherer").text = str("stone gatherer: ",stone_gatherer)
				get_node("npopulation").text = str("population: ", pop)
	pass # Replace with function body.



#increase farmer num
func _on_farmer_input_event(viewport, event, shape_idx):
	#increase farmer num
	if event is InputEvent:
		if event.is_pressed():
			if pop > 0:
				farmer += 1
				pop -= 1
				get_node("nfarmer").text = str("farmer: ",farmer)
				get_node("npopulation").text = str("population: ", pop)
		auto_gather_food()
	pass # Replace with function body.



#decrease farmer num
func _on_farmer_min_input_event(viewport, event, shape_idx):
	#decrease farmer num
	if event is InputEvent:
		if event.is_pressed():
			if farmer > 0:
				farmer -= 1
				pop += 1
				get_node("nfarmer").text = str("farmer: ",farmer)
				get_node("npopulation").text = str("population: ", pop)
	pass # Replace with function body.



#auto gather 2 wood per lumberjack every 10 sec
func auto_gather_wood():
	#auto gather 2 wood per lumberjack every 10 sec
	if lumberjack >= 1:
		if can_gather_wood == true:
			wood += (2*lumberjack)
			can_gather_wood = false
			timerWood.start()
			get_node("nwood").text = str("wood: ", wood)
		else:
			pass
	else:
		pass
		



#auto gather 2 stone per stone gatherer every 10 sec
func auto_gather_stone():
	#auto gather 2 stone per stone gatherer every 10 sec
	if stone_gatherer >= 1:
		if can_gather_stone == true:
			stone += (2*stone_gatherer)
			can_gather_stone = false
			timerStone.start()
			get_node("nstone").text = str("stone: ", stone)
		else:
			pass
	else:
		pass
		



#auto gather 2 food per farmer every 10 sec
func auto_gather_food():
	#auto gather 2 food per farmer every 10 sec
	if farmer > 0:
		if can_gather_food == true:
			food += (2*farmer)
			can_gather_food = false
			timerFood.start()
			get_node("nfood").text = str("food: ", food)
		else:
			pass
	else:
		pass



