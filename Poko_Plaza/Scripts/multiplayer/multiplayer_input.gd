extends MultiplayerSynchronizer

var direction_ud
var direction_lr


# Called when the node enters the scene tree for the first time.
func _ready():
	direction_ud = Input.get_axis("move_up","move_down")
	direction_lr = Input.get_axis("move_left","move_right")

	if get_multiplayer_authority() != multiplayer.get_unique_id():
		set_process(false)
		set_physics_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	direction_ud = Input.get_axis("move_up","move_down")
	direction_lr = Input.get_axis("move_left","move_right")

	
