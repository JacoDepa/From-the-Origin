extends Area2D

onready var wood = 0
onready var stone = 0
onready var hut = 0
onready var stone_gatherer = 0
onready var pop = 0
onready var nwood = 50
onready var flag = 1


func _ready():
	self.visible = false
	pass


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

