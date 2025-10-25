extends Control

@onready var eco_label: Label = $EcoLabel
@onready var profit_label: Label = $ProfitLabel
@onready var auido_click: AudioStreamPlayer = $auido_click


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func update_label(eco, profit):
	if eco < 0:
		eco_label.modulate = Color.RED
	elif eco > 0:
		eco_label.modulate = Color.GREEN
		
	if profit < 0:
		profit_label.modulate = Color.RED
	elif profit > 0:
		profit_label.modulate = Color.GREEN
	

	eco_label.text = "Eco Increase: " + str(eco) + "%"
	profit_label.text = "Profit Increase: " + str(profit) + "%"
