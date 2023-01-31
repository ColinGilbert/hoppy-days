extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var lives = 3
var coins = 0
const target_number_of_coins = 10
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Gamestate")

func hurt():
	lives -= 1
	if lives < 0:
		end_game()
	else:
		$Player.hurt()
		get_tree().call_group("GUI", "update_GUI", lives, coins)
	print(lives)

func add_coin():
	coins += 1
	get_tree().call_group("GUI", "update_GUI", lives, coins)
	if (coins % target_number_of_coins) == 0:
		life_up()
		

func life_up():
	lives += 1
	get_tree().call_group("GUI", "update_GUI", lives, coins)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")

func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")
