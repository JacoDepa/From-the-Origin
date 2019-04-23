extends Area2D

onready var wood = 0
onready var hut = 0
onready var lumberjack = 0
onready var pop = 0

func _ready():
	self.visible = false
	pass


func _on_lumberjack_input_event(viewport, event, shape_idx):
	if pop >= 1:
		if event is InputEvent:
			if event.is_pressed():
				lumberjack += 1
				pop -= 1
				get_node("/root/Node/nlumberjack").text = str("lumberjack: ",lumberjack)
				get_node("/root/Node/npopulation").text = str("population: ",pop)
	pass # Replace with function body.


func _on_build_hut_input_event(viewport, event, shape_idx):
	if wood >= 50:
		if event is InputEvent:
			if event.is_pressed():
				hut += 1
				pop += 4
	
	if hut >= 1:
		self.visible = true
	pass # Replace with function body.


func _on_gather_wood_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
	pass # Replace with function body.


func _on_lumberjackminus_input_event(viewport, event, shape_idx):
	if lumberjack >= 1:
		if event is InputEvent:
			if event.is_pressed():
				lumberjack -= 1
				pop += 1
	pass # Replace with function body.
