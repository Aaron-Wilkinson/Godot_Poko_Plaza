extends Area2D
var number = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	print("test is ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	print("increment")
	number += 1
	$Label.text = str(number)
	
