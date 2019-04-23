extends Label

onready var wood = 0
onready var hut = 0

func _ready():
	self.visible = false
	pass



func _on_gather_wood_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
	pass # Replace with function body.



func _on_build_hut_input_event(viewport, event, shape_idx):
	if wood >= 50:
		if event is InputEvent:
			if event.is_pressed():
				hut += 1
	
	if hut >= 1:
		self.visible = true
	pass # Replace with function body.
