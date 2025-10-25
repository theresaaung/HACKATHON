extends Control

var eco_percent: float = 0
var profit_percent: float = 0

@export var eco_mult: float
@export var profit_mult: float


@onready var eco_percent_label: Label = $EcoPercent
@onready var profit_percent_label: Label = $ProfitPercent




func _on_slider_value_changed(value: float) -> void:
	eco_percent = value * eco_mult
	profit_percent = -value * profit_mult
	update_labels()




func update_labels() -> void:
	if eco_percent < 0:
		eco_percent_label.modulate = Color.RED
	else:
		eco_percent_label.modulate = Color.GREEN
		
	if profit_percent < 0:
		profit_percent_label.modulate = Color.RED
	else:
		profit_percent_label.modulate = Color.GREEN
		
	
	
	eco_percent_label.text = str(eco_percent) + "% Eco"
	profit_percent_label.text = str(profit_percent) + "% Profit"
	


func get_eco_percent():
	return eco_percent
	
func get_profit_percent():
	return profit_percent
