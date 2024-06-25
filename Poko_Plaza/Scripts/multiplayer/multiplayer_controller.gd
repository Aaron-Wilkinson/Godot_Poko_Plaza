extends CharacterBody2D

@export var speed = 100
@onready var animated_sprite = $AnimatedSprite2D
var input_direction_ud
var input_direction_lr
var open = false

@export var player_id := 1:
	set(id):
		player_id = id
		%InputSynchronizer.set_multiplayer_authority(id)

func _ready():
	if multiplayer.get_unique_id() == player_id:
		$Camera2D.make_current()
	else:
		$Camera2D.enabled = false
	
	
func _apply_movement_from_input(delta):
	input_direction_ud = %InputSynchronizer.direction_ud
	input_direction_lr = %InputSynchronizer.direction_lr
	
	var velocity=Vector2.ZERO
	if input_direction_ud:
		velocity.y = input_direction_ud * speed
	if input_direction_lr:
		velocity.x = input_direction_lr * speed
	if velocity.length() > 1:
		velocity = velocity.normalized() 
		
	if velocity.x != 0:
		if velocity.x > 0:
			animated_sprite.flip_h = false
			animated_sprite.play("Walk_LR")
		if velocity.x < 0:
			animated_sprite.flip_h = true
			animated_sprite.play("Walk_LR")
	elif velocity.y != 0:
		if velocity.y > 0:
			animated_sprite.play("Walk_DN")
		if velocity.y < 0:
			animated_sprite.play("Walk_UP")
	else:
		animated_sprite.play("Idle")
	
	position += (velocity*speed) * delta
	move_and_slide()
	

func _physics_process(delta):
	if multiplayer.is_server():
		_apply_movement_from_input(delta)
	

func player_shop_method():
	pass


	


