extends AnimatedSprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Player_animate(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x > 0:
		play("walk")
		set_flip_h(false)
	elif motion.x < 0:
		play("walk")
		set_flip_h(true)
	else:
		play("idle")
