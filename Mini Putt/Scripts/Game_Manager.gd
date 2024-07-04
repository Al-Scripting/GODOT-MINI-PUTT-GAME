extends Node2D

var Player_1_Score : int  = 0 
var Player_2_Score : int  = 0 

var Player_1_finished : bool  = false 
var Player_2_finished : bool  = false 

#Objects
var Player_1 : CharacterBody2D
var Player_2 : CharacterBody2D


var Player_Turn = 1

signal Player_1_Turn
signal Player_2_Turn


# Called when the node enters the scene tree for the first time.
func _ready():
	Player_1 = get_node("Player_1_Ball")
	Player_2 = get_node("Player_2_Ball")
	
	#check to make sure
	print(Player_1)
	print(Player_2)
	Switch_Players()

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func Switch_Players():
	if Player_Turn == 1:
		if Player_2_finished == false:
			Player_Turn = 2
			Player_2_Score += 1
			emit_signal("Player_2_Turn")
		else:
			Player_1_Score += 1
			emit_signal("Player_1_Turn")
	else:
		if Player_1_finished == false:
			Player_Turn = 1
			Player_1_Score += 1
			emit_signal("Player_1_Turn")
		else:
			Player_2_Score += 1
			emit_signal("Player_2_Turn")

func Check_Winner():
	if Player_1_finished == true and Player_2_finished == true:
		get_node("Label").visible = true
		if Player_1_Score < Player_2_Score:
			get_node("Label").text = "PLAYER 1 WINS"
		elif Player_2_Score < Player_1_Score:
			get_node("Label").text = "PLAYER 2 WINS"
		else:
			get_node("Label").text = "TIE"
			
		await get_tree().create_timer(3.0).timeout
		get_tree().change_scene_to_file("res://main2.tscn")


func _on_player_1_ball_completed_hole():
	Player_1_finished = true
	Check_Winner()
	pass # Replace with function body.


func _on_player_2_ball_completed_hole():
	Player_2_finished = true
	Check_Winner()
	pass # Replace with function body.


func _on_player_1_ball_stopped():
	emit_signal("Player_2_Turn")
	pass # Replace with function body.


func _on_player_2_ball_stopped():
	emit_signal("Player_1_Turn")
	pass # Replace with function body.


