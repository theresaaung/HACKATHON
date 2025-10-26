extends Node2D
@onready var title_label: Label = $TitleLabel
@onready var money_label: Label = $MoneyLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func update_label(money, carbon):
	money_label.text = "$" + str(money-(carbon/2))





func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
