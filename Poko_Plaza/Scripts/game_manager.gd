extends Node

@onready var label = $"../VisitLabel"
var visit = 0

#enable before running dedicated server
#func _ready():
	#if OS.has_feature("dedicated_server"):
		#print("starting dedicated server")
		#become_host()
	#else:
		#print("no connection")

func add_visit():
	visit += 1
	label.text = str(visit)
	
func become_host():
	print("Start host")
	MultiplayerManager.become_host()
	
func join_player_2():
	print("joinplayer2")
	MultiplayerManager.join_player_2()
