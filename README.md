# GODOT Mini Putt Game

## Overview
This repository contains a **mini putt golf game** built using **Godot Engine**. It is part of a **24-hour coding challenge** to learn and implement a new programming skill.

## Features
- **Physics-Based Gameplay**: Realistic ball movement and collision handling.
- **Multiple Levels**: Different hole layouts with increasing difficulty.
- **Simple Controls**: Click and drag to set ball direction and power.
- **Score Tracking**: Records strokes per level and displays final score.
- **Godot Engine Implementation**: Uses GDScript for logic and Godot’s physics engine.

## Dependencies
To run this project, install **Godot 4.x** from:
[Godot Official Website](https://godotengine.org/)

## How It Works
The game mechanics follow these steps:
1. **Drag and Release**: Player drags the mouse to aim and set shot power.
2. **Ball Movement**: Applies force based on shot power and direction.
3. **Collision Detection**: Determines when the ball reaches the hole.
4. **Score Calculation**: Tracks strokes taken per hole.
5. **Win Condition**: Advances to the next level upon completing a hole.

## Code Breakdown
### 1. Ball Physics & Movement
```gdscript
extends RigidBody2D

var shooting = false
var force = Vector2.ZERO

func _input(event):
    if event is InputEventMouseButton and event.pressed:
        shooting = true
    elif event is InputEventMouseButton and !event.pressed:
        shooting = false
        apply_impulse(force)
```
- Detects mouse input to aim and shoot the ball.
- Uses `apply_impulse()` to simulate shooting force.

### 2. Hole Detection
```gdscript
func _on_Hole_area_entered(body):
    if body.name == "Ball":
        print("Hole in one!")
        advance_to_next_level()
```
- Detects when the ball enters the hole.
- Triggers level advancement upon successful putt.

## How to Play
1. Clone the repository:
```bash
git clone https://github.com/Al-Scripting/GODOT-MINI-PUTT-GAME
```
2. Open the project in **Godot Engine**.
3. Run the game and start playing.

## Contributing
Contributions and suggestions are welcome! Open an issue or submit a pull request.

## License
This project is open-source and available under the MIT License.
