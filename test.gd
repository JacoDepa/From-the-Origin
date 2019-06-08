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
onready var carbon = 0
onready var iron = 0
onready var carbon_miner = 0
onready var iron_miner = 0
onready var n_string = 0
onready var n_bone = 0
onready var gold = 0
onready var fur = 0
onready var n_leather = 0
onready var hunter = 0 

#Timer
onready var timerWood = null
onready var timerStone = null
onready var timerFood = null
onready var timerCarbon = null
onready var timerIron = null
onready var timerHunter = null

onready var delay = 10
onready var mine_delay = 40 
onready var hunter_delay = 30 

onready var can_gather_wood = true
onready var can_gather_stone = true
onready var can_gather_food = true
onready var can_gather_carbon = true
onready var can_gather_iron = true
onready var can_gather_fur = true


"""
#food timer
onready var food_pay_timer = null
onready var food_pay_delay = 10
onready var time_to_pay_food = true
"""

#Buttons
onready var gather_wood = get_node("gather_wood")
onready var gather_stone = get_node("gather_stone")
onready var build_hut = get_node("build_hut")
onready var gather_food = get_node("gather_food")
onready var exit = get_node("exit")

#RichTextLabels
onready var num_wood = get_node("nwood")
onready var num_stone = get_node("nstone")
onready var num_hut = get_node("nhut")
onready var num_pop = get_node("npopulation")
onready var num_food = get_node("nfood")
onready var num_lumberjack = get_node("nlumberjack")
onready var num_stone_gatherer = get_node("nstone_gatherer")
onready var num_farmer = get_node("nfarmer")
onready var num_carbon = get_node("ncarbon")
onready var num_iron = get_node("niron")
onready var num_string = get_node("nstring")
onready var num_bone = get_node("nbone")
onready var num_fur = get_node("nfur")
onready var num_leather = get_node("nleather")


#lumberjack
onready var lumberjack_plus = get_node("lumberjack+")
onready var lumbrjack_min = get_node("lumberjack-")
onready var nlumberjack = get_node("nlumberjack")

#stone gatherer
onready var stone_gatherer_plus = get_node("stone_gatherer+")
onready var stone_gatherer_min = get_node("stone_gatherer-")
onready var nstone_gatherer = get_node("nstone_gatherer")

#framer
onready var farmer_plus = get_node("farmer+")
onready var farmer_min = get_node("farmer-")
onready var nfarmer = get_node("nfarmer")

#carbon miner
onready var carbon_miner_plus = get_node("carbon_miner_plus")
onready var carbon_miner_min = get_node("carbon_miner_min")
onready var ncarbon_miner = get_node("ncarbon_miner")

#iron miner
onready var iron_miner_plus = get_node("iron_miner_plus")
onready var iron_miner_min = get_node("iron_miner_min")
onready var niron_miner = get_node("niron_miner")

#hunter
onready var hunter_plus = get_node("hunter_plus")
onready var hunter_min = get_node("hunter_min")
onready var nhunter = get_node("nhunter")

#Buildings
onready var construction_lab = get_node("constructionLab")
onready var market = get_node("market")
onready var hunting_hut = get_node("hunting_hut")

#items
onready var pickaxe = get_node("buy_pickaxe")
onready var axe = get_node("buy_axe")
onready var hoe = get_node("buy_hoe")
onready var string = get_node("buy_string")
onready var bone = get_node("buy_bone")
onready var bow = get_node("buy_bow")
onready var compass = get_node("buy_compass")
onready var leather = get_node("buy_leather")


#mines
onready var carbon_mine = get_node("carbon_mine")
onready var iron_mine = get_node("iron_mine")

#explication notes
onready var info_lumberjack = get_node("info_lumberjack")
onready var info_stone_gatherer = get_node("info_stone_gatherer")
onready var info_farmer = get_node("info_farmer")
onready var info_carbon_miner = get_node("info_carbon_miner")
onready var info_iron_miner = get_node("info_iron_miner")
onready var info_hunter = get_node("info_hunter")
onready var need_food = get_node("need_food")

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
	
	#auto gather carbon timer
	timerCarbon = Timer.new()
	timerCarbon.set_one_shot(true)
	timerCarbon.set_wait_time(mine_delay)
	timerCarbon.connect("timeout", self, "on_timeout_comlete_carbon")
	add_child(timerCarbon)
	
	#auto gather iron timer
	timerIron = Timer.new()
	timerIron.set_one_shot(true)
	timerIron.set_wait_time(mine_delay)
	timerIron.connect("timeout", self, "on_timeout_comlete_iron")
	add_child(timerIron)
	
	#auto gather fur timer
	timerHunter = Timer.new()
	timerHunter.set_one_shot(true)
	timerHunter.set_wait_time(hunter_delay)
	timerHunter.connect("timeout", self, "on_timeout_complete_fur")
	add_child(timerHunter)
	
	"""
	#time to pay food timer
	food_pay_timer = Timer.new()
	food_pay_timer.set_one_shot(true)
	food_pay_timer.set_wait_time(food_pay_delay)
	food_pay_timer.connect("time_to_pay_food", self, "time_to_pay_food")
	add_child(food_pay_timer)
	"""
	
	#makes works and works num non visible
	lumberjack_plus.visible = false
	lumbrjack_min.visible = false
	nlumberjack.visible = false
	stone_gatherer_plus.visible = false
	stone_gatherer_min.visible = false
	nstone_gatherer.visible = false
	farmer_plus.visible = false
	farmer_min.visible = false
	nfarmer.visible = false
	carbon_miner_min.visible = false
	carbon_miner_plus.visible = false
	ncarbon_miner.visible = false
	iron_miner_min.visible = false
	iron_miner_plus.visible = false
	niron_miner.visible = false
	hunter_min.visible = false
	hunter_plus.visible = false
	nhunter.visible = false
	
	#make buttons non visibles
	gather_stone.visible = false
	gather_food.visible = false
	build_hut.visible = false
	
	#makes RichTextLabels non visibles
	num_stone.visible = false
	num_hut.visible = false
	num_pop.visible = false
	num_food.visible = false
	num_lumberjack.visible = false
	num_stone_gatherer.visible = false
	num_farmer.visible = false
	num_carbon.visible = false
	num_iron.visible = false
	num_string.visible = false
	num_bone.visible = false
	num_fur.visible = false
	num_leather.visible = false
	
	#makes buildings non visible
	construction_lab.visible = false
	market.visible = false
	hunting_hut.visible = false
	
	#makes mines non visible
	carbon_mine.visible = false
	iron_mine.visible = false
	
	
	pass


"""
#activate time to pay food
func time_to_pay_food():
	time_to_pay_food = true
	auto_pay_food()
"""


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


#activate carbon auto gather
func on_timeout_comlete_carbon():
	can_gather_carbon = true
	auto_gather_carbon()



#activate iron auto gather
func on_timeout_comlete_iron():
	can_gather_iron = true
	auto_gather_iron()

#activate fur auto gather
func on_timeout_complete_fur():
	can_gather_fur = true
	auto_gather_fur()


#gather wood
func _on_gather_wood_input_event(viewport, event, shape_idx):
	#gather wood
	var flagg = 0
	
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if flagg == 0:
				wood += 1
				num_wood.text = str("wood: ", wood)
			while flagg <= 10:
				flagg += 1
			if flagg == 10:
				flagg = 0
	
	
	#make buttons visible when wood >= 20
	if wood >= 20:
		gather_stone.visible = true
		num_stone.visible = true
	if wood >= 50:
		build_hut.visible = true
		num_pop.visible = true
		num_hut.visible = true
	
	#makes buildings visible
	if stone >= 75 and wood >= 150:
		construction_lab.visible = true
		
	if iron >= 50:
		market.visible = true
	pass # Replace with function body.



#gather stone
func _on_gather_stone_input_event(viewport, event, shape_idx):
	#gather stone
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			stone += 1
			num_stone.text = str("stone: ", stone)
	
	#makes buildings visible
	if stone >= 75 and wood >= 150:
		construction_lab.visible = true
	
	if iron >= 50:
		market.visible = true
	pass # Replace with function body.



#buld hut if you have enough wood
func _on_build_hut_input_event(viewport, event, shape_idx):
	#buld hut if you have enough wood
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if wood >= nwood:
				hut += 1
				pop += 4
				wood -= nwood
				flag = 1
				num_hut.text = str("hut: ", hut)
				num_pop.text = str("population: ", pop)
				num_wood.text = str("wood: ", wood)
	
	if hut >= 1 and flag == 1:
		#augment wood neccessary to build hut
		flag = 0
		nwood += 50
		get_node("build_hut/Label").text = str("build hut (",nwood," wood)")
		
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
		need_food.visible = true
		
		#makes buttons visibles
		gather_food.visible = true
		
		#makes RichTextLabel visible
		num_food.visible = true
		num_lumberjack.visible = true
		num_stone_gatherer.visible = true
		num_farmer.visible = true
	
	pass # Replace with function body.



#gather food
func _on_gather_food_input_event(viewport, event, shape_idx):
	#gather food
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			food += 1
			num_food.text = str("food: ", food)
	
	#makes buildings visible
	if stone >= 75 and wood >= 150:
		construction_lab.visible = true
	
	if iron >= 50:
		market.visible = true
	#auto_pay_food()
	pass # Replace with function body.



#augment lumberjack num
func _on_lumberjack_input_event(viewport, event, shape_idx):
	#augment lumberjack num
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if pop > 0:
				lumberjack += 1
				pop -= 1
				num_lumberjack.text = str("lumberjack: ",lumberjack)
				num_pop.text = str("population: ", pop)
				info_lumberjack.visible = true
		
		if get_node("buy_axe/Label").text == str("axe (150 wood, 70 stone)"):
			info_lumberjack.text = str("+", (2 * lumberjack), " wood in 10 sec")
		
		elif get_node("buy_axe/Label").text == str("axe (bought)"):
			info_lumberjack.text = str("+", (3 * lumberjack), " wood in 10 sec")
		
		auto_gather_wood()
	pass # Replace with function body.



#decrease lumberjack num
func _on_lumberjack_min_input_event(viewport, event, shape_idx):
	#decrease lumberjack num
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if lumberjack > 0:
				lumberjack -= 1
				pop += 1
				num_lumberjack.text = str("lumberjack: ",lumberjack)
				num_pop.text = str("population: ", pop)
				if get_node("buy_axe/Label").text == str("axe (150 wood, 70 stone)"):
					info_lumberjack.text = str("+", (2 * lumberjack), " wood in 10 sec")
		
				elif get_node("buy_axe/Label").text == str("axe (bought)"):
					info_lumberjack.text = str("+", (3 * lumberjack), " wood in 10 sec")
				
	if lumberjack == 0:
		info_lumberjack.visible = false
	pass # Replace with function body.



#increase stone gatherer num
func _on_stone_gatherer_input_event(viewport, event, shape_idx):
	#increase stone gatherer num
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if pop > 0:
				stone_gatherer += 1
				pop -= 1
				num_stone_gatherer.text = str("stone gatherer: ",stone_gatherer)
				num_pop.text = str("population: ", pop)
				info_stone_gatherer.visible = true
				info_stone_gatherer.text = str("+", (2 * stone_gatherer), " stone in 10 sec")
		auto_gather_stone()
	pass # Replace with function body.



#decrease dtone gatherer num
func _on_stone_gatherer_min_input_event(viewport, event, shape_idx):
	#decrease dtone gatherer num
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if stone_gatherer > 0:
				stone_gatherer -= 1
				pop += 1
				num_stone_gatherer.text = str("stone gatherer: ",stone_gatherer)
				num_pop.text = str("population: ", pop)
				info_stone_gatherer.text = str("+", (2 * stone_gatherer), " stone in 10 sec")
				
	if stone_gatherer == 0:
		info_stone_gatherer.visible = false
	pass # Replace with function body.



#increase farmer num
func _on_farmer_input_event(viewport, event, shape_idx):
	#increase farmer num
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if pop > 0:
				farmer += 1
				pop -= 1
				num_farmer.text = str("farmer: ",farmer)
				num_pop.text = str("population: ", pop)
				info_farmer.visible = true
		if get_node("buy_hoe/Label").text == str("hoe (130 wood, 70 stone)"):
			info_farmer.text = str("+", (2 * farmer), " food in 10 sec")
		
		elif get_node("buy_hoe/Label").text == str("hoe (bought)"):
			info_farmer.text = str("+", (3 * farmer), " food in 10 sec")
		
		auto_gather_food()
		
	pass # Replace with function body.



#decrease farmer num
func _on_farmer_min_input_event(viewport, event, shape_idx):
	#decrease farmer num
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if farmer > 0:
				farmer -= 1
				pop += 1
				num_farmer.text = str("farmer: ",farmer)
				num_pop.text = str("population: ", pop)
				if get_node("buy_hoe/Label").text == str("hoe (130 wood, 70 stone)"):
					info_farmer.text = str("+", (2 * farmer), " food in 10 sec")
		
				elif get_node("buy_hoe/Label").text == str("hoe (bought)"):
					info_farmer.text = str("+", (3 * farmer), " food in 10 sec")
				
	if farmer == 0:
		info_farmer.visible = false
	pass # Replace with function body.



#auto gather 2 wood per lumberjack every 10 sec
func auto_gather_wood():
	#auto gather 2 wood per lumberjack every 10 sec
	if food > 0:
		if lumberjack >= 1:
			if can_gather_wood == true and get_node("buy_axe/Label").text == str("axe (150 wood, 70 stone)"):
				wood += (2*lumberjack)
				food -= lumberjack
				num_food.text = str("food: ", food)
				can_gather_wood = false
				timerWood.start()
				num_wood.text = str("wood: ", wood)
			elif can_gather_wood == true and get_node("buy_axe/Label").text == str("axe (bought)"):
				wood += (3*lumberjack)
				food -= lumberjack
				num_food.text = str("food: ", food)
				can_gather_wood = false
				timerWood.start()
				num_wood.text = str("wood: ", wood)
				
				
			else:
				pass
		else:
			pass
	else:
		pass



#auto gather 2 stone per stone gatherer every 10 sec
func auto_gather_stone():
	#auto gather 2 stone per stone gatherer every 10 sec
	
	if food > 0:
		if stone_gatherer >= 1:
			if can_gather_stone == true:
				stone += (2*stone_gatherer)
				food -= stone_gatherer
				num_food.text = str("food: ", food)
				can_gather_stone = false
				timerStone.start()
				num_stone.text = str("stone: ", stone)
			else:
				pass
		else:
			pass
	else:
		pass



#auto gather 2 food per farmer every 10 sec
func auto_gather_food():
	#auto gather 2 food per farmer every 10 sec
	if food > 0:
		if farmer > 0:
			if can_gather_food == true and get_node("buy_hoe/Label").text == str("hoe (130 wood, 70 stone)"):
				food += (2*farmer)
				food -= farmer
				num_food.text = str("food: ", food)
				can_gather_food = false
				timerFood.start()
				num_food.text = str("food: ", food)
			elif can_gather_food == true and get_node("buy_hoe/Label").text == str("hoe (bought)"):
				food += (3*farmer)
				food -= farmer
				num_food.text = str("food: ", food)
				can_gather_food = false
				timerFood.start()
				num_food.text = str("food: ", food)
				
				
			else:
				pass
		else:
			pass
	else:
		pass



#auto gather 2 carbon every 40 sec per carbon_miner
func auto_gather_carbon():
	if food > 0:
		if carbon_miner > 0:
			if can_gather_carbon == true:
				carbon += (2 * carbon_miner)
				food -= carbon_miner
				num_food.text = str("food: ", food)
				can_gather_carbon = false
				timerCarbon.start()
				num_carbon.text = str("carbon: ", carbon)
			
			else:
				pass
		else:
			pass
	else:
		pass



#auto gather 2 iron every 40 sec per iron miner
func auto_gather_iron():
	if food > 0:
		if iron_miner > 0:
			if can_gather_iron == true:
				iron += (2 * iron_miner)
				food -= iron_miner
				num_food.text = str("food: ", food)
				can_gather_iron = false
				timerIron.start()
				num_iron.text = str("iron: ", iron)
			else:
				pass
		else:
			pass
	else:
		pass


#auto gather 2 fur every 30 sec per hunter
func auto_gather_fur():
	if food > 0:
		if hunter > 0:
			if can_gather_fur == true:
				fur += (2 * hunter)
				food -= hunter
				num_food.text = str("food: ", food)
				can_gather_fur = false
				timerHunter.start()
				num_fur.text = str("fur: ", fur)
			else:
				pass
		else:
			pass
	else:
		pass



"""
#automatically subtruct 10 food per hut every 2.5 min
func auto_pay_food():
	if hut > 0:
		if time_to_pay_food == true:
			time_to_pay_food = false
			food_pay_timer.start()
			if food >= (10*hut):
				food -= (10*hut)
				num_food.text = str("food: ",food)
			elif food < (10*hut):
				pop -= 1
				num_pop.text = str("population: ",pop)
			elif pop == 0:
				randomize()
				var random_num = randi() % 16
				print(random_num)
				
				if random_num <= 5:
					lumberjack -= 1
					num_lumberjack.text = str("lumberjack: ",lumberjack)
				
				elif random_num > 5 and random_num <= 10:
					stone_gatherer -= 1
					num_stone_gatherer.text = str("stone gatherer: ", stone_gatherer)
				
				elif random_num > 10:
					farmer -= 1
					num_farmer.text = str("farmer: ", farmer)
					
				else:
					pass
			else:
				pass
		else:
			pass
	else:
		pass
"""

func _on_constructionLab_input_event(viewport, event, shape_idx):
	
	#unlock constructio lab
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if wood >= 500 and stone >= 150:
				wood -= 500
				num_wood.text = str("wood: ", wood)
				stone -= 150
				num_stone.text = str("stone: ", stone)
				get_node("constructionLab/Label").text = str("Construction Lab")
				
	
	#get to the lab
	if get_node("constructionLab/Label").text == str("Construction Lab"):
		if event is InputEvent:
			if event.is_pressed() and not event.is_echo():
				#makes everything non visible
				gather_food.visible = false
				gather_stone.visible = false
				gather_wood.visible = false
				build_hut.visible = false
				num_farmer.visible = false
				num_food.visible = false
				num_hut.visible = false
				num_lumberjack.visible = false
				num_pop.visible = false
				num_stone.visible = false
				num_stone_gatherer.visible = false
				num_wood.visible = false
				lumberjack_plus.visible = false
				lumbrjack_min.visible = false
				stone_gatherer_min.visible = false
				stone_gatherer_plus.visible = false
				nlumberjack.visible = false
				nstone_gatherer.visible = false
				farmer_min.visible = false
				farmer_plus.visible = false
				construction_lab.visible = false
				carbon_mine.visible = false
				num_carbon.visible = false
				iron_mine.visible = false
				num_iron.visible = false
				carbon_miner_plus.visible = false
				carbon_miner_min.visible = false
				ncarbon_miner.visible = false
				iron_miner_plus.visible = false
				iron_miner_min.visible = false
				niron_miner.visible = false
				info_carbon_miner.visible = false
				info_farmer.visible = false
				info_iron_miner.visible = false
				info_lumberjack.visible = false
				info_stone_gatherer.visible = false
				need_food.visible = false
				market.visible = false
				string.visible = false
				num_string.visible = false
				bone.visible = false
				num_bone.visible = false
				hunting_hut.visible = false
				compass.visible = false
				num_fur.visible = false
				num_leather.visible = false
				leather.visible = false
				hunter_min.visible = false
				hunter_plus.visible = false
				nhunter.visible = false
				info_hunter.visible = false
				
				#makes items and exit visible
				pickaxe.visible = true
				axe.visible = true
				hoe.visible = true
				exit.visible = true
				if n_string >= 5:
					bow.visible = true
				else:
					bow.visible = false
	
	pass # Replace with function body.



#buy pickaxe
func _on_buy_pickaxe_input_event(viewport, event, shape_idx):
	#buy pickaxe
	if wood >= 150 and stone >= 60:
		if event is InputEvent:
			if event.is_pressed() and not event.is_echo():
				get_node("buy_pickaxe/Label").text = str("pickaxe (bought)")
	pass # Replace with function body.




#exit construction lab
func _on_exit_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			#makes everything visible
			gather_food.visible = true
			gather_stone.visible = true
			gather_wood.visible = true
			build_hut.visible = true
			num_farmer.visible = true
			num_food.visible = true
			num_hut.visible = true
			num_lumberjack.visible = true
			num_pop.visible = true
			num_stone.visible = true
			num_stone_gatherer.visible = true
			num_wood.visible = true
			lumberjack_plus.visible = true
			lumbrjack_min.visible = true
			stone_gatherer_min.visible = true
			stone_gatherer_plus.visible = true
			nlumberjack.visible = true
			nstone_gatherer.visible = true
			farmer_min.visible = true
			farmer_plus.visible = true
			construction_lab.visible = true
			info_farmer.visible = true
			info_lumberjack.visible = true
			info_stone_gatherer.visible = true
			need_food.visible = true
			
			
			
			#mines
			if get_node("buy_pickaxe/Label").text == str("pickaxe (bought)"):
				carbon_mine.visible = true
				num_carbon.visible = true
				iron_mine.visible = true
				num_iron.visible = true
				
			else:
				carbon_mine.visible = false
				num_carbon.visible = false
				iron_mine.visible = false
				num_iron.visible = false
			
			if get_node("buy_pickaxe/Label").text == str("pickaxe (bought)") and hut > 0:
				carbon_miner_plus.visible = true
				carbon_miner_min.visible = true
				ncarbon_miner.visible = true
				iron_miner_plus.visible = true
				iron_miner_min.visible = true
				niron_miner.visible = true
				info_carbon_miner.visible = true
				info_iron_miner.visible = true
			
			else:
				carbon_miner_plus.visible = false
				carbon_miner_min.visible = false
				ncarbon_miner.visible = false
				iron_miner_plus.visible = false
				iron_miner_min.visible = false
				niron_miner.visible = false
				info_carbon_miner.visible = false
				info_iron_miner.visible = false
			
			if get_node("buy_bow/Label").text == str("bow (bought)"):
				#unlock hunting hut
				hunting_hut.visible = true
			else:
				hunting_hut.visible = false
				#not ulock hunting hut
			
			if get_node("hunting_hut/Label").text == str("Hunting hut"):
				hunter_min.visible = true
				hunter_plus.visible = true
				nhunter.visible = true
			else:
				hunter_min.visible = false
				hunter_plus.visible = false
				nhunter.visible = false
			
			
			
			
			#makes items and exit non visible
			pickaxe.visible = false
			axe.visible = false
			hoe.visible = false
			exit.visible = false
			string.visible = false
			bone.visible = false
			bow.visible = false
			compass.visible = false
			leather.visible = false
			
			if n_string > 0:
				num_string.visible = true
			else:
				num_string.visible = false
				
			if n_bone > 0:
				num_bone.visible = true
			else:
				num_bone.visible = false
			
			if iron >= 50:
				market.visible = true
				
			if n_leather > 0:
				num_leather.visible = true
			else:
				num_leather.visible = false
	pass # Replace with function body.



#buy axe
func _on_buy_axe_input_event(viewport, event, shape_idx):
	if wood >= 150 and stone >= 70:
		if event is InputEvent:
			if event.is_pressed() and not event.is_echo():
				get_node("buy_axe/Label").text = str("axe (bought)")
	pass # Replace with function body.



#buy hoe
func _on_buy_hoe_input_event(viewport, event, shape_idx):
	if wood >= 130 and stone >= 70:
		if event is InputEvent:
			if event.is_pressed() and not event.is_echo():
				get_node("buy_hoe/Label").text = str("hoe (bought)")
	pass # Replace with function body.



#carbon mine: carbon + 1 per click
func _on_carbon_mine_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			carbon += 1
			num_carbon.text = str("carbon: ", carbon)
	pass # Replace with function body.



#iron mine : iron +1 per click
func _on_iron_mine_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			iron += 1
			num_iron.text = str("iron: ", iron)
	
	if iron >= 50:
		market.visible = true
	pass # Replace with function body.



#add carbon miner
func _on_carbon_miner_plus_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if pop > 0:
				carbon_miner += 1
				pop -= 1
				num_pop.text = str("population: ",pop)
				ncarbon_miner.text = str("carbon miner: ", carbon_miner)
				
	if carbon_miner > 0:
		info_carbon_miner.visible = true
		info_carbon_miner.text = str("+", (2 * carbon_miner), " carbon in 40 sec")
	
	auto_gather_carbon()
	pass # Replace with function body.



#remove carbon miner
func _on_carbon_miner_min_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if carbon_miner > 0:
				carbon_miner -= 1
				pop += 1
				num_pop.text = str("population: ",pop)
				ncarbon_miner.text = str("carbon miner: ", carbon_miner)
				info_carbon_miner.text = str("+", (2 * carbon_miner), " carbon in 40 sec")
	
	if carbon_miner == 0:
		info_carbon_miner.visible = false
	
	pass # Replace with function body.



#add iron miner
func _on_iron_miner_plus_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if pop > 0:
				iron_miner += 1
				pop -= 1
				num_pop.text = str("population: ",pop)
				niron_miner.text = str("iron miner: ", iron_miner)
				
	if iron_miner > 0:
		info_iron_miner.visible = true
		info_iron_miner.text = str("+", (2 * iron_miner), " iron in 40 sec")
	
	auto_gather_iron()
	pass # Replace with function body.



#remove iron miner
func _on_iron_miner_min_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if iron_miner > 0:
				iron_miner -= 1
				pop += 1
				num_pop.text = str("population: ",pop)
				niron_miner.text = str("iron miner: ", iron_miner)
				info_iron_miner.text = str("+", (2 * iron_miner), " iron in 40 sec")
	
	if iron_miner == 0:
		info_iron_miner.visible = false
	
	pass # Replace with function body.





func _on_market_input_event(viewport, event, shape_idx):
	
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if wood >= 750 and stone >= 350:
				wood -= 750
				num_wood.text = str("wood: ", wood)
				stone -= 350
				num_stone.text = str("stone: ", stone)
				get_node("market/Label").text = str("Market")
				
	
	#get to the lab
	if get_node("market/Label").text == str("Market"):
		if event is InputEvent:
			if event.is_pressed() and not event.is_echo():
				#makes everything non visible
				gather_food.visible = false
				gather_stone.visible = false
				gather_wood.visible = false
				build_hut.visible = false
				num_farmer.visible = false
				num_food.visible = false
				num_hut.visible = false
				num_lumberjack.visible = false
				num_pop.visible = false
				num_stone.visible = false
				num_stone_gatherer.visible = false
				num_wood.visible = false
				lumberjack_plus.visible = false
				lumbrjack_min.visible = false
				stone_gatherer_min.visible = false
				stone_gatherer_plus.visible = false
				nlumberjack.visible = false
				nstone_gatherer.visible = false
				farmer_min.visible = false
				farmer_plus.visible = false
				construction_lab.visible = false
				carbon_mine.visible = false
				num_carbon.visible = false
				iron_mine.visible = false
				num_iron.visible = false
				carbon_miner_plus.visible = false
				carbon_miner_min.visible = false
				ncarbon_miner.visible = false
				iron_miner_plus.visible = false
				iron_miner_min.visible = false
				niron_miner.visible = false
				info_carbon_miner.visible = false
				info_farmer.visible = false
				info_iron_miner.visible = false
				info_lumberjack.visible = false
				info_stone_gatherer.visible = false
				need_food.visible = false
				market.visible = false
				construction_lab.visible = false
				num_string.visible = false
				num_bone.visible = false
				hunting_hut.visible = false
				hunter_min.visible = false
				hunter_plus.visible = false
				nhunter.visible = false
				info_hunter.visible = false
				
				#makes things visible 
				exit.visible = true
				string.visible = true
				bone.visible = true
				compass.visible = true
				leather.visible = true
	pass # Replace with function body.


func _on_buy_string_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if carbon >= 10:
				n_string += 1
				num_string.text = str("string: ", n_string)
				carbon -= 10
				num_carbon.text = str("carbon: ", carbon)
	pass # Replace with function body.


func _on_buy_bone_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed() and not event.is_echo():
			if carbon >= 2:
				n_bone += 1
				num_bone.text = str("bone: ", n_bone)
				carbon -= 2
				num_carbon.text = str("carbon: ", carbon)
	pass # Replace with function body.


func _on_buy_bow_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if n_string >= 10 and wood >= 100:
				get_node("buy_bow/Label").text = str("bow (bought)")
				n_string -= 10
				num_string.text = str("string: ", n_string)
				wood -= 100
				num_wood.text = str("wood: ", wood)
	pass # Replace with function body.


func _on_hunting_hut_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if wood >= 1050 and stone >= 500 and iron >= 20:
				get_node("hunting_hut/Label").text = str("Hunting hut")
				wood -= 1050
				stone -= 500
				iron -= 20
				num_wood.text = str("wood: ", wood)
				num_stone.text = str("stone: ", stone)
				num_iron.text = str("iron: ", iron)
				hunter_min.visible = true
				hunter_plus.visible = true
				nhunter.visible = true
				num_fur.visible = true
	pass # Replace with function body.

"""REMEMBER TO CHECK IF THIS WORKS WHENT CREATING GOLD MINERS"""
func _on_buy_compass_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if iron >= 100 and gold >= 10:
				iron -= 100
				num_iron.text = str("iron: ", iron)
				gold -= 10
				#REMEMBER TO MAKE GOLD COUNT ON SCREEN CHANGE
				get_node("buy_compass/Label").text = str("compass (bought)")
	pass # Replace with function body.


func _on_buy_leather_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if fur >= 5:
				fur -= 5
				num_fur.text = str("fur: ", fur)
				leather += 1
				num_leather.text = str("leather: ", leather)
	pass # Replace with function body.


func _on_hunter_plus_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if pop > 0:
				hunter += 1
				pop -= 1
				nhunter.text = str("hunter: ", hunter)
				num_pop.text = str("population: ", pop)
	
	if hunter > 0:
		info_hunter.visible = true
		info_hunter.text = str("+", (2 * hunter), " fur in 30 sec")
	
	auto_gather_fur()
	pass # Replace with function body.


func _on_hunter_min_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if hunter > 0:
				hunter -= 1
				pop += 1
				nhunter.text = str("hunter: ", hunter)
				num_pop.text = str("population: ", pop)
	
	if hunter == 0:
		info_hunter.visible = false
	pass # Replace with function body.
