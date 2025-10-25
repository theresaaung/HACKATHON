extends VBoxContainer

var packaging_eco: int = 0
var packaging_profit: int = 0
@onready var eco_percent: Label = $Percent/EcoPercent
@onready var profit_percent: Label = $Percent/ProfitPercent



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass




func _on_slider_value_changed(value: float) -> void:
	packing_eco = value
	packing_profit = -value


	eco_percent.text = str(packaging_eco)
