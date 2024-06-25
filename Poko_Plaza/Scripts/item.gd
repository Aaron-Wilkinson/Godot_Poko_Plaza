extends AnimatedSprite2D

var newimage = "lamp"
var newlabel = "lamp"
var newprice = "15"
var table = [newimage, newlabel, newprice]

var i = 0
var coffee = ["coffee", "coffee", 5]
var book = ["book", "book", 10]
var items = [coffee, book]

func _ready():
	additem()
	play(items[i][0])
	$label.text = items[i][1]
	$price.text = str(items[i][2])
	
func _physics_process(delta):
	pass
	
func additem():
	items.append(table)
	
func changeitem():
	play(items[i][0])
	$label.text = items[i][1]
	$price.text = str(items[i][2])	
	print("itemchange")


func _on_button_pressed():
	if i == len(items)-1:
		i = 0
	else:
		i = i + 1
	changeitem()
	


func _on_button_2_pressed():
	if i == 0:
		i = len(items) - 1
	else:
		i = i - 1
	changeitem()
	
