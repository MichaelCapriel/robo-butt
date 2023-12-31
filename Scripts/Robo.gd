extends CharacterBody2D
class_name Player

const FRICTION = 10.0
@export var SPEED: float = 300.0
@export var JUMP_VELOCITY: float = -400.0
@export var GROUND_POUND_FALL_SPEED: float = 1000.0

var is_ground_pound: bool = false

var score = 0

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var anim = get_node("AnimationPlayer")
func _ready():
	Signals.connect("rewardPlayer", player_Rewarded)

func _physics_process(delta: float) -> void:
	if not is_ground_pound:
		if Input.is_action_just_pressed("jump_action") and is_on_floor():
			velocity.y = JUMP_VELOCITY
			$AnimationPlayer.play("Jump")
			
		if Input.is_action_just_pressed("slam_action") and not is_on_floor():
				_start_ground_pound()

	if not is_on_floor():
		if not is_ground_pound:
			velocity.y += gravity * delta
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	if velocity.y == 0 and is_on_floor():
		$AnimationPlayer.play("Run")
#
		
	if velocity.y < 0:
		$AnimationPlayer.play("Fall")

	move_and_slide()

	for i in get_slide_collision_count(): _collide(get_slide_collision(i))

func _start_ground_pound():
	is_ground_pound = true
	velocity = Vector2.ZERO
	$AnimationPlayer.play("SlamStart")

func _ground_pound_move():
	velocity = Vector2(0, GROUND_POUND_FALL_SPEED)

func _collide(collision: KinematicCollision2D):
	if is_on_floor() and is_ground_pound:
		#$AnimationPlayer.play("SlamDOWN")
		_end_ground_pound()

func _end_ground_pound():
			is_ground_pound = false

func player_Rewarded(scoreToAdd):
	score+=scoreToAdd
	print(score)
