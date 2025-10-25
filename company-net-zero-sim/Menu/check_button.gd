extends CheckButton


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Sync the check state with current fullscreen mode
	button_pressed = (DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN)
	# Connect the toggled signal (if not done in the editor)
	toggled.connect(_on_toggled)


func _on_toggled(toggled_on: bool) -> void:
	AudioGlobal.click()
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
