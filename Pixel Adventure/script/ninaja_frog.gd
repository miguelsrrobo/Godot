extends KinematicBody2D

const SPEED_NINJA_FROG = 10
const GRAVITY_NINJA_FROG = 20
const JUMP_HEIGHT_NINJA_FROG = -600
const NORMAL = Vector2(0,-1)
var move_ninja_frog = Vector2()

func input(delta):
	move_ninja_frog.y += GRAVITY_NINJA_FROG
	if Input.is_action_pressed("ui_left"):
		move_ninja_frog.x -= SPEED_NINJA_FROG
		$AnimatedSprite.flip_h = true
	elif Input.is_action_pressed("ui_right"):
		move_ninja_frog.x += SPEED_NINJA_FROG
		$AnimatedSprite.flip_h = false
	else: 
		move_ninja_frog.x = 0

	if move_ninja_frog.x != 0 and is_on_floor():
		$AnimatedSprite.play("run")
	elif !is_on_floor():
		$AnimatedSprite.play("jump")
	else:
		$AnimatedSprite.play("idle") 
	
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		move_ninja_frog.y = JUMP_HEIGHT_NINJA_FROG
		$AnimatedSprite.play("jump")
		
	move_ninja_frog = move_and_slide(move_ninja_frog, NORMAL)

func _physics_process(delta):
	input(delta)


