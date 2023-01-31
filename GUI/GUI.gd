extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/TextureRect/HBoxContainer/LivesCount.text = "3"
	$Control/TextureRect/HBoxContainer/CoinCount.text = "0"

func update_GUI(lives, coins):
	$Control/TextureRect/HBoxContainer/LivesCount.text = str(lives)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
