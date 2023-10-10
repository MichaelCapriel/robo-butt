extends "ScrollMovement.gd"
class_name Enemy

var _isKilled = false

func _physics_process(_delta):
	move()

func _on_dmg_body_entered(body):
	if body.name == "Player" && _isKilled == false:
		print("player died")
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_slam_kill_body_entered(body):
	if body.name == "Player":
		_kill()

func _kill() -> void:
	queue_free()
	print("killed")
	Signals.emit_signal("rewardPlayer", 10)
	_isKilled = true
	
	
