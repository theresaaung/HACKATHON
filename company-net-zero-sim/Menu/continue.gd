extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_backbutton_pressed() -> void:
	AudioGlobal.click()
	get_tree().change_scene_to_file("res://Menu/intro.tscn")


func _on_next2_button_pressed() -> void:
	AudioGlobal.click()
	get_tree().change_scene_to_file("res://Menu/continue.tscn")
