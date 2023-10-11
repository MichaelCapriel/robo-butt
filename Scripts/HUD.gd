extends CanvasLayer 

signal start_game

var score = 0

#func _ready():
	#Signals.connect("rewardPlayer", player_Rewarded)

func update_score(score):
	$ScoreLabel.text = str(score)

func player_Rewarded(scoreToAdd):
	score+=scoreToAdd
	Signals.emit_signal("updateScore",score)

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_game_over():
	show_message("GAME OVER")
