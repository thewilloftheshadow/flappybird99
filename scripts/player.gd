extends CharacterBody2D

signal hit


const SPEED = 300.0
const JUMP_VELOCITY = -500.0

var dead = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func die():
	dead = true
	set_rotation(PI/2)
	

func _physics_process(delta):
	velocity.y += gravity * delta
	if not dead:
		# Handle jump.
		if Input.is_action_just_pressed("flap"):
			velocity.y = JUMP_VELOCITY

		set_rotation(deg_to_rad(velocity.y * 0.05))
	
	move_and_slide()
