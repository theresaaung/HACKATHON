extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float):
	pass


func start_pressed() -> void:
	print("Game has started")
	get_tree().change_scene_to_file("res://theresa/intro.tscn")


func options_pressed() -> void:
	pass # Replace with function body.
	#get_tree().change_scene_to_file()

func exit_pressed() -> void:
	get_tree().quit()
