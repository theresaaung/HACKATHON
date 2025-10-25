extends Control

@onready var main_buttons: VBoxContainer = $MainButtons
@onready var settings: Panel = $Settings

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass

func _ready():
	main_buttons.visible = true
	settings.visible = false

func _on_startbutton_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/intro.tscn")


func _on_settingsbutton_pressed() -> void:
	main_buttons.visible = false
	settings.visible = true


func _on_exitbutton_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	settings.visible = false
	main_buttons.visible = true
