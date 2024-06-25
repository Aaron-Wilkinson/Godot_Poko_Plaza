extends Area2D

@onready var game_manager = %GameManager


func _ready():
	$shop_menu.visible = false


func _on_buy_zone_body_entered(body):
	if body.has_method("player_shop_method"):
		print("openshop")
		print(body)
		$shop_menu.visible = true
		game_manager.add_visit()


func _on_buy_zone_body_exited(body):
	$shop_menu.visible = false
