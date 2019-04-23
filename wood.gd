extends Area2D

onready var pop = 0
onready var wood = 0
onready var nwood = 50
onready var flag = 0
onready var lumberjack = 0
onready var timer = null
onready var delay = 10
onready var can_gather = true


func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout", self, "on_timeout_complete")
	add_child(timer)
	print("dentro func_ready")
	print(timer)
	pass

func on_timeout_complete():
	can_gather = true
	auto_gather()

func _on_Area2D_input_event(viewport, event, shape_idx):
	
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
			get_node("/root/Node/nwood").text = str("wood: ",wood)
	
	
	pass # Replace with function body.




func _on_build_hut_input_event(viewport, event, shape_idx):
	if wood >= nwood:
		if event is InputEvent:
			if event.is_pressed():
				wood -= nwood
				flag = 1
				pop += 4
				get_node("/root/Node/nwood").text = str("wood: ",wood)
	if flag == 1:
		nwood += 50
		flag = 0
	pass # Replace with function body.



func _on_lumberjackplus_input_event(viewport, event, shape_idx):
	
	pass # Replace with function body.


func _on_lumberjackminus_input_event(viewport, event, shape_idx):
	if lumberjack >= 1:
		if event is InputEvent:
			if event.is_pressed():
				lumberjack -= 1
	pass # Replace with function body.


	

func _on_lumberjack_input_event(viewport, event, shape_idx):
	#print("entro in func_lumberjack")
	if event is InputEvent:
		if event.is_pressed():
			if pop >= 1:
				lumberjack += 1
				#print(lumberjack)
				pop -= 1
	#print("func_auto_gather")
	auto_gather()
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
	