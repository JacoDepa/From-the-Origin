extends RichTextLabel

onready var wood = 0

func _ready():
	self.visible = false
	pass






func _on_gather_wood_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
	if wood == 50:
		self.visible = true
	else:
		pass
	pass # Replace with function body.
