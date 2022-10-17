extends Node2D

var PlayerScore = 0
var EnemyScore = 0

func _ready():
	_restart_game()

func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(960, 540)
	$RestartTimer.start()

func _process(delta):
	$PlayerScore.text = str(PlayerScore)
	$EnemyScore.text = str(EnemyScore)

func _on_Arco_Player_body_entered(body):
	if body is Ball:
		EnemyScore += 1
		_restart_game()


func _on_Arco_Enemy_body_entered(body):
	if body is Ball:
		PlayerScore += 1
		_restart_game()
