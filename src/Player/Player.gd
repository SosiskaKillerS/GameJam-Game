extends CharacterBody2D

@export var speed = 500 

func get_input(): 
	var input_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = input_direction * speed 
	
	
func _physics_process(delta):
	if Input.is_action_pressed("ATTACK"):
		$gun.shoot()
	get_input()
	move_and_slide()
		
