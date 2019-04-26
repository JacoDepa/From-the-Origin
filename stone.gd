extends Area2D

onready var wood = 0
onready var stone = 0
onready var hut = 0
onready var stone_gatherer = 0
onready var pop = 0
onready var nwood = 50
onready var flag = 1
onready var timer = null
onready var delay = 10
onready var can_gather = true

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	self.visible = false
	pass

func on_timeout_complete():
	can_gather = true
	auto_gather()

func _on_stone_input_event(viewport, event, shape_idx):
	
	if event is InputEvent:
		if event.is_pressed():
			stone += 1
			get_node("/root/Node/nstone").text = str("stone: ",stone)
	
	pass # Replace with function body.


func _on_gather_wood_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
	if wood == 20:
		self.visible = true
	else:
		pass
	pass # Replace with function body.



func _on_stone_gatherer_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			if pop > 0:
				stone_gatherer += 1
				pop -= 1
	auto_gather()
	pass # Replace with function body.


func _on_srone_gatherer_min_input_event(viewport, event, shape_idx):
	if stone_gatherer >= 1:
		if event is InputEvent:
			if event.is_pressed():
				stone_gatherer -= 1
				pop += 1
	pass # Replace with function body.


func _on_build_hut_input_event(viewport, event, shape_idx):
	if wood >= nwood:
		if event is InputEvent:
			if event.is_pressed():
				hut += 1
				pop += 4
				flag = 1
	
	if hut >= 1 and flag == 1:
		flag = 0
		nwood += 50
	pass # Replace with function body.

func auto_gather():
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