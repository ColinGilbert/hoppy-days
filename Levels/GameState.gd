extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lives = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Gamestate")

func hurt():
	lives -= 1
	$Player.hurt()
	print(lives)
	if lives < 0:
		end_game()
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")
