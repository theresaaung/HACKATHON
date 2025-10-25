extends Control

<<<<<<< HEAD


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

=======
@onready var main_buttons: VBoxContainer = $MainButtons
@onready var settings: Panel = $Settings
>>>>>>> 63e32a5f3bdd1eb562ec4417dd869579a5307a0b

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass

func _ready():
	main_buttons.visible = true
	settings.visible = false

func _on_startbutton_pressed() -> void:
	AudioGlobal.auido_click
	get_tree().change_scene_to_file("res://Menu/intro.tscn")


func _on_settingsbutton_pressed() -> void:
<<<<<<< HEAD
	AudioGlobal.click()
	pass # Replace with function body.
=======
	main_buttons.visible = false
	settings.visible = true
>>>>>>> 63e32a5f3bdd1eb562ec4417dd869579a5307a0b


func _on_exitbutton_pressed() -> void:
	AudioGlobal.click()
	get_tree().quit()

func _on_back_pressed() -> void:
	settings.visible = false
	main_buttons.visible = true
