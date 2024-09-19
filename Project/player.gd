extends CharacterBody2D

const SPEED = 300.0

# Update
func _process(delta: float) -> void:
	pass

# Fixed update
func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	pass

func get_input():
	var direction = Input.get_vector("left", "right", "up", "down")
	#print(direction)
	if direction != Vector2.ZERO :
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	pass
