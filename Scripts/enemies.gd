extends "ScrollMovement.gd"
class_name Enemy 

func _physics_process(_delta):
	move()

func _on_dmg_body_entered(body):
	if body.name == "Player":
		Signals.emit_signal("killPlayer")
		print("player died")
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
