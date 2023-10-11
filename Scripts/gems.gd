extends "ScrollMovement.gd"
class_name Gems

func _physics_process(_delta):
	move()

func _on_pick_up_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("updateScore", 2)
		queue_free()
		print("picked up")
		

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

