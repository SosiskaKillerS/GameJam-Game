extends CharacterBody2D


@export var speed = 100
@export var player_chase = false
var player = null
@export var hp = 1500

func _ready():
	add_to_group("mobs")

func _physics_process(delta):
	if player_chase:
		position += (player.position-position)/speed

func _on_area_2d_body_entered(body):
	player = body
	player_chase = true

func _on_area_2d_body_exited(body):
	player = null
	player_chase = false

