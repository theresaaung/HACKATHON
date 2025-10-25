extends Control

var eco_percent: float = 0
var profit_percent: float = 0

@onready var eco_percent_label: Label = $EcoPercent
@onready var profit_percent_label: Label = $ProfitPercent


func _on_slider_value_changed(value: float) -> void:
	eco_percent = value
	profit_percent = -value


	eco_percent_label.text = str(eco_percent) + "% Eco"
	profit_percent_label.text = str(profit_percent) + "% Profit"


func get_eco_percent():
	return eco_percent
	
func get_profit_percent():
	return profit_percent
