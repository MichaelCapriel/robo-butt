extends CharacterBody2D

const FRICTION = 10.0
const SPEED = 300.0
const JUMP_VELOCITY = -450.0
const GROUND_POUND_FALL_SPEED: float = 1000.0

var is_ground_pound: bool = false
var score = 0

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var anim = get_node("AnimationPlayer")

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		if not is_ground_pound:
			velocity.y += gravity * delta
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimationPlayer.play("Jump")
		print("Jumping")
		
	if Input.is_action_just_pressed("ui_down") and not is_on_floor():
			print("Slamming")
			_start_ground_pound()
			

	if velocity.y == 0 and is_on_floor():
		anim.play("Run")
		
	if velocity.y < 0:
		$AnimationPlayer.play("Fall")

	move_and_slide()

	for i in get_slide_collision_count(): _collide(get_slide_collision(i))

func _collide(collision: KinematicCollision2D):
	if is_on_floor() and is_ground_pound:
		#$AnimationPlayer.play("SlamDOWN")

func _start_ground_pound():
	is_ground_pound = true
	velocity = Vector2.ONE
	$AnimationPlayer.play("SlamStart")

func _ground_pound_move():
	velocity = Vector2(0, GROUND_POUND_FALL_SPEED)

func _end_ground_pound():
	is_ground_pound = false
	velocity = Vector2.ZERO
	if velocity.y == 0:
		anim.play("Run")

#func rewardPlayer(scoreToAdd)
