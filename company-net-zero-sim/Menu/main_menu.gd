extends Control
@onready var auido_click: AudioStreamPlayer = $auido_click


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass


func _on_startbutton_pressed() -> void:
	auido_click.play()
	get_tree().change_scene_to_file("res://Menu/intro.tscn")



func _on_settingsbutton_pressed() -> void:
	auido_click.play()
	pass # Replace with function body.
	


func _on_exitbutton_pressed() -> void:	
	auido_click.play()
	get_tree().quit()
