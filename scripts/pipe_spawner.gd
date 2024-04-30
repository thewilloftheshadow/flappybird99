extends Node

@onready var timer = $Timer
@export var pipes: PackedScene

func ready():
	_on_timer_timeout()

func _on_timer_timeout():
	var new_pipes = pipes.instantiate()
	add_child(new_pipes)

func getGameManager():
	return %GameManager
