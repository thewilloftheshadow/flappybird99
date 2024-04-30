extends Node

@onready var player = %Player
@onready var timer = $Timer
@onready var score_label = %ScoreLabel

var score = 0
var dead = false

func _ready():
	updateScoreText()

func playerDie():
	dead = true
	player.die()
	timer.start()

func _on_timer_timeout():
	get_tree().reload_current_scene()

func isDead():
	return dead
	
func _process(_delta):
	if Input.is_action_pressed("reset"):
		get_tree().reload_current_scene()


func addPoint():
	score += 1
	updateScoreText()

func updateScoreText():
	score_label.text = "Score: " + str(score)

