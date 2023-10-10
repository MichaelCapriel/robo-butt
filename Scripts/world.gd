extends Node2D

var score = 0

func new_game():
	score = 0
	$StartTimer.start()
	$ScoreTimer.start()

func game_over():
	$ScoreTimer.stop()

func _on_score_timer_timeout():
	score += 1
	$HUD.update_score(score)

