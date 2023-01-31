extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const SPEED = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	set_as_toplevel(true)
	global_position = get_parent().global_position

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += SPEED * delta
	manage_collisions()
	
func manage_collisions():
	var collider = $Area2D.get_overlapping_bodies()
	for obj in collider:
		if obj.name == "Player":
			get_tree().call_group("Gamestate", "hurt")
		queue_free()
		
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
