extends Node2D

	
func _enter_tree():
	yield(get_tree().create_timer(1.0), "timeout")
	self.queue_free()

func _process(delta):
	$number.set_text("+"+str(Global.mouse_click))
