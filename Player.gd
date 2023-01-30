extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

signal animate

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var motion = Vector2(0, 0)

const SPEED = 1000
const GRAVITY = 50
const UP = Vector2(0,-1)
const JUMP_SPEED = 2000
const WORLD_LIMIT = 10000
const BOOST_MULTIPLIER = 1.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)

func apply_gravity():
	if position.y > WORLD_LIMIT:
		end_game()
	if is_on_floor():
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	elif is_on_wall():
		motion.x - 0
	else:
		motion.y += GRAVITY

func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED
		$PlayerAudio.stream = load("res://SFX/jump1.ogg")
		$PlayerAudio.play()


func move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
	else:
		motion.x = 0

func animate():
	emit_signal("animate", motion)
	
func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")

func hurt():
	position.y -= 1
	yield(get_tree(),"idle_frame")
	motion.y -= JUMP_SPEED
#	lives -= 1
	$PlayerAudio.stream = load("res://SFX/pain.ogg")
	$PlayerAudio.play()
#	if lives < 0:
#		end_game()
	
func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y -= JUMP_SPEED * BOOST_MULTIPLIER
