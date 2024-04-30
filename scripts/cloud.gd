extends Node2D	

const SPEED = 180

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = (round(DisplayServer.window_get_size().x) / 2) + 600
	position.y = int(randf_range(-60,60))

 
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not get_parent().getGameManager().isDead():
		position.x -= SPEED * delta
		
		if(position.x < (0 - (round(DisplayServer.window_get_size().x) / 2) - 600)):
			queue_free()
