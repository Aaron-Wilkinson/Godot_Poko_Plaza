extends CharacterBody2D

@export var speed = 100
@onready var animated_sprite = $AnimatedSprite2D


func _ready():
	print("ready")
	

func _physics_process(delta):
	var direction_ud = Input.get_axis("move_up","move_down")
	var direction_lr = Input.get_axis("move_left","move_right")
	var velocity=Vector2.ZERO
	
	if direction_ud:
		velocity.y = direction_ud * speed
	if direction_lr:
		velocity.x = direction_lr * speed
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

func player_shop_method():
	pass

			

	


