extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var timeout = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite/AnimationPlayer.play("CloudDrift")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()
		
func fire():
	if timeout == false:
		$Sprite/RayCast2D.add_child(load("res://Particles/Lightning.tscn").instance())
		$Sprite/Timer.start()
		timeout = true


func _on_Timer_timeout():
	timeout = false
