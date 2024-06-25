extends MultiplayerSynchronizer
const MultiplayerController = preload("res://Scripts/multiplayer/multiplayer_controller.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func _on_area_2d_body_entered(body):	
	print(body.player_id)
	set_visibility_for(body.player_id, false)
	
