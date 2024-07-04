extends Node2D

var Power : float = 100
var Min_Power = 100
var Max_Power = 400
var Speed = 0.05  # Reduce speed for slower movement
var Going_up : bool = true

var Meter : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Meter = get_node("Meter")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Power_bar()
	pass

func Power_bar():
	if Going_up == true:
		Power += Speed
		if Power > Max_Power: 
			Power = Max_Power
			Going_up = false
	else:
		Power -= Speed
		if Power < Min_Power:
			Power = Min_Power
			Going_up = true
	Meter.scale.x = (Power - Min_Power)/(Max_Power - Min_Power)
