extends Area2D

onready var wood2 = 0
var stone = 0

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
			wood2 += 1
	if wood2 == 20:
		self.visible = true
	else:
		pass
	pass # Replace with function body.
