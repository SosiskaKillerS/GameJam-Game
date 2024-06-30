extends CharacterBody2D

var speed : int
var screen_size : Vector2

func _ready():
	speed = 25

func get_input():
	var input_dir = Input.get_vector("left","right","up", "down")
	velocity = input_dir * speed
func _physics_process(delta):
	get_input()
	move_and_slide()
	var mouse = get_local_mouse_position()
	var angle = snappedf(mouse.angle(), PI/4) / (PI/4)
	
	if velocity.length() != 0:
		$AnimationPlayer.play()
	else:
		$AnimationPlayer.stop()
		
