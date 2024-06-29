extends CharacterBody2D

@export var speed:int = 500 
@export var health:int = 1000

func get_input(): 
	var input_direction = Input.get_vector("LEFT", "RIGHT", "UP", "DOWN")
	velocity = input_direction * speed 
	
	
func _physics_process(delta):
	get_input()
	move_and_slide()
