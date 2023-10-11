extends Node2D

var score = 0
var gempoints = 2

func updateScore(Gems):
	Signals.connect("Gems", gempoints)
	score += gempoints
	$HUD.update_score(score)

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

