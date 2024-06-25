extends Node

const SERVER_PORT = 8080
const SERVER_IP = "127.0.0.1"
var multiplayer_scene = preload("res://Scenes/multiplayer_player.tscn")
var _players_spawn_node
var host_mode_enabled = false

func become_host():
	print("become host")
	
	_players_spawn_node = get_tree().get_current_scene().get_node("Players")
	
	var server_peer = ENetMultiplayerPeer.new()
	server_peer.create_server(SERVER_PORT)
	
	multiplayer.multiplayer_peer = server_peer
	
	multiplayer.peer_connected.connect(_add_player)
	multiplayer.peer_disconnected.connect(_del_player)
	_remove_single_player()
	
	# enable before running dedicated server
	#if not OS.has_feature("dedicated_server"):
	#	_add_player(1)
	
	_add_player(1)
	
func join_player_2():
	print("player2")
	var client_peer = ENetMultiplayerPeer.new()
	client_peer.create_client(SERVER_IP, SERVER_PORT)
	multiplayer.multiplayer_peer = client_peer
	_remove_single_player()

func _add_player(id: int):
	print("Player %s joined" % id)
	var player_to_add = multiplayer_scene.instantiate()
	player_to_add.player_id = id
	player_to_add.name = str(id)
	_players_spawn_node.add_child(player_to_add, true)
	
func _del_player(id: int):
	print("Player %s left" % id)
	if not _players_spawn_node.has_node(str(id)):
		return
	_players_spawn_node.get_node(str(id)).queue_free()

func _remove_single_player():
	print("remove single player")
	var player_to_remove = get_tree().get_current_scene().get_node("Player")
	player_to_remove.queue_free()
