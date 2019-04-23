extends Timer
"""
onready var lumberjack = 0
onready var timer = null
onready var delay = 10
onready var can_gather = true
onready var wood = 0

func _ready():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout", self, "on_timeout_complete")
	pass

func on_timeout_complete():
	can_gather = true

func _on_lumberjackplus_input_event(viewport, event, shape_idx):
	
	if event is InputEvent:
		if event.is_pressed():
			lumberjack += 1
	pass # Replace with function body.


func _on_lumberjackminus_input_event(viewport, event, shape_idx):
	if lumberjack >= 1:
		if event is InputEvent:
			if event.is_pressed():
				lumberjack -= 1
	pass # Replace with function body.

#func gather_wood():
	
	
	
	

func _on_gather_wood_input_event(viewport, event, shape_idx):
	if event is InputEvent:
		if event.is_pressed():
			wood += 1
	
	if lumberjack >= 1:
		if can_gather == true:
			wood += 2
			can_gather = false
			timer.start()
			get_node("/root/Node/nwood").text = str("wood: ", wood)
	pass # Replace with function body.
"""


