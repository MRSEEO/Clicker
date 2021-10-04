extends Spatial

var effect_click = preload("res://media/effects/click.tscn")

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Audio.stop_music()
	
	$Camera/UI/playing_now.set_text("Playing now: "+Audio.playing_now)
	$Camera/UI/Label.set_text("Aeugh's: "+str(Global.clicks))
	$Camera/UI/autoclicks.set_text("Aeugh's per second: "+str(Global.autoclick))
	


func _on_Area_input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed == true:
			Global.clicks += Global.mouse_click
			
			Audio.play_sound("res://media/sounds/click.wav")
			
			
			var mouse = get_viewport().get_mouse_position()
			var e_c = effect_click.instance()
			e_c.position = mouse
			add_child(e_c)

func _on_Timer_timeout():
	Global.clicks += Global.autoclick
