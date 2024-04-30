extends Node2D	

const MAX = 250
const SPEED = 300

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = (round(DisplayServer.window_get_size().x) / 2) + 50
	position.y = randf_range(0-MAX,MAX)

 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not get_parent().getGameManager().isDead():
		position.x -= SPEED * delta
		
		if(position.x < (0 - (round(DisplayServer.window_get_size().x) / 2) - 50)):
			queue_free()

func _on_top_pipe_body_entered(body):
	get_parent().getGameManager().playerDie()

func _on_bottom_pipe_body_entered(body):
	get_parent().getGameManager().playerDie()

func _on_point_trigger_body_entered(body):
	get_parent().getGameManager().addPoint()

