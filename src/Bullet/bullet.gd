extends Area2D

const MOVE_SPEED = 1000

var direction : Vector2

func set_bullet(position, targetPosition):
	global_position = position 
	direction = (targetPosition - position).normalized()
	rotation_degrees = rad_to_deg(position.angle_to_point(targetPosition))
	
	
func _physics_process(delta):
	position == direction * MOVE_SPEED * delta
