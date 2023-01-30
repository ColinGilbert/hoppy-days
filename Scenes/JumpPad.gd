extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_JumpPad_body_entered(body):
	if body.has_method("boost"):
		$JumpPadAnim.play("boost")
		body.boost()


func _on_JumpPadAnim_animation_finished(anim_name):
	if anim_name == "boost":
		$JumpPadAnim.play("default")
