extends Area2D

onready var wood = 0
onready var hut = 0
onready var pop = 0
onready var nwood = 50
onready var flag = 0

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


func _on_build_hut_input_event(viewport, event, shape_idx):
	if wood >= nwood:
		if event is InputEvent:
			if event.is_pressed():
				hut += 1
				wood -= nwood
				pop += 4
				flag = 1
				get_node("/root/Node/nhut").text = str("hut: ",hut)
				get_node("/root/Node/npopulation").text = str("population: ",pop)
				get_node("/root/Node/nwood").text = str("wood: ",wood)
	else:
		
		pass
	
	if hut >= 1 and flag == 1:
		flag = 0
		nwood += 50
		get_node("/root/Node/build_hut/Label").text = str("build hut (",nwood," wood)")
		
	
	
	pass # Replace with function body.
	