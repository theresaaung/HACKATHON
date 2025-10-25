extends Control
@onready var auido_click: AudioStreamPlayer = $auido_click


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_exitbutton_pressed() -> void:
	auido_click.play()
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_nextbutton_pressed() -> void:
<<<<<<< HEAD
	auido_click.play()
	get_tree().change_scene_to_file("res://Menu/intro2.tscn")
=======
	get_tree().change_scene_to_file("res://scenes/main.tscn")
>>>>>>> cf911150064a5f2794a5962fc25eab19901263a3
