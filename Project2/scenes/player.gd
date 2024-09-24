extends CharacterBody2D


const SPEED = 150.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionHorizontal := Input.get_axis("move_left", "move_right")
	var directionVertical := Input.get_axis("move_up", "move_down")
	#Sprite direction + animation
	if directionHorizontal > 0:
		animated_sprite_2d.flip_h = false
	elif directionHorizontal < 0:
		animated_sprite_2d.flip_h = true
	#Animation
	if directionHorizontal == 0:
		animated_sprite_2d.play("idle")
	else:
		animated_sprite_2d.play("run")

	if directionHorizontal:
		velocity.x = directionHorizontal * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)	
	
	if directionVertical:
		velocity.y = directionVertical * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
		

	move_and_slide()
