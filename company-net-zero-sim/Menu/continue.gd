extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_backbutton_pressed() -> void:
	AudioGlobal.play_flip()
	get_tree().change_scene_to_file("res://Menu/intro.tscn")


func _on_next2_button_pressed() -> void:

	AudioGlobal.click()
	get_tree().change_scene_to_file("res://scenes/main.tscn")


func _on_minimize_pressed() -> void:
	AudioGlobal.click()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_fullscreen_pressed() -> void:
	AudioGlobal.click()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_quit_pressed() -> void:
	AudioGlobal.click()
	get_tree().quit()
