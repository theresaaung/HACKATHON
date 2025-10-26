extends Control

@onready var page_flip: AudioStreamPlayer2D = $"page flip"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass


func _on_exitbutton_pressed() -> void:
	AudioGlobal.click()
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_nextbutton_pressed() -> void:
	AudioGlobal.play_flip()
	#AudioGlobal.click()
	get_tree().change_scene_to_file("res://Menu/continue.tscn")


func _on_minimize_pressed() -> void:
	
	AudioGlobal.click()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_fullscreen_pressed() -> void:
	
	AudioGlobal.click()
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)


func _on_quit_pressed() -> void:
	
	AudioGlobal.click()
	get_tree().quit()
