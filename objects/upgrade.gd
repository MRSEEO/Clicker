extends Button

class_name upgrade

export var button_name = "Battery"
export var button_icon = ""

export var autoclicks = 1
export var price = 100

var own = 0

func _ready():
	text = button_name
	
	if button_icon != "":
		icon = load(button_icon)
	else:
		icon = load("res://media/icons/placeholder.jpg")
	
func _process(delta):
	if Global.clicks >= price:
		disabled = false
	else:
		disabled = true
		
	$own.set_text(str(own))
	$HBoxContainer/price.set_text(str(price))


func _on_update_pressed():
	if Global.clicks >= price:
		Audio.play_sound("res://media/sounds/update.wav")
		Global.clicks -= price
		Global.autoclick += autoclicks
		
		own += 1
		
		price = stepify(price, 1) * 1.2
		
	elif Global.clicks >= price and own >= 1:
		Audio.play_sound("res://media/sounds/update.wav")
		Global.clicks -= price
		autoclicks *= 2
		Global.autoclick += autoclicks
		
		own += 1
		
		price = stepify(price, 1.0) * 1.2
		
	else:
		pass
		
		
