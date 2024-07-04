extends CharacterBody2D

var Direction_Sprite

var Top_Speed = 300
var Speed = -4
var vel = Vector2()

var dir = 0 

var launching : bool = false
var My_Turn: bool = false

signal Completed_Hole
signal Ball_Stopped

func _ready():
	Direction_Sprite = get_node("Direction")
	Direction_Sprite.visible = false  # Make sure the sprite is visible initially

func _physics_process(delta):
	if My_Turn:
		Calculate_Ball(delta)
	pass

func Calculate_Ball(delta):
	if Input.is_key_pressed(KEY_RIGHT):
		if not launching:
			dir = 0.05
			rotate(dir)
			
	if Input.is_key_pressed(KEY_LEFT):  # Fixed to check for left key press
		if not launching:
			dir = -0.05
			rotate(dir)

	if not launching:
		if Input.is_key_pressed(KEY_SPACE):
			launching = true
			
			Speed = $"../PowerBar".Power
			
			
			vel = Vector2(Speed, 0).rotated(rotation)
			Direction_Sprite.visible = false

	if launching:
		vel *= 0.99  # Apply friction to velocity
		if Speed > 0:
			Speed -= 2
		else:
			launching = false
			Speed = 0 
			vel = Vector2(Speed, 0).rotated(rotation)
			My_Turn = false
			emit_signal("Ball_Stopped")
			Direction_Sprite.visible = false
	
	var collision = move_and_collide(vel * delta)
	
	
	if collision:
		if Speed != 0:
		
			vel = vel.bounce(collision.get_normal())
			rotation = vel.angle()  # Adjust rotation based on velocity angle
			
			var collider = collision.get_collider() 
			if collider.is_in_group("Hole"):
				Finished_Hole()


func Finished_Hole():
	visible = false
	get_node("CollisionShape2D").disabled = true
	emit_signal("Completed_Hole")
	print("FINISHED HOLE")

func _on_main_player_1_turn():
	Direction_Sprite.visible = true
	My_Turn = true
	pass # Replace with function body.


func _on_main_player_2_turn():
	Direction_Sprite.visible = true
	My_Turn = true
	pass # Replace with function body.
