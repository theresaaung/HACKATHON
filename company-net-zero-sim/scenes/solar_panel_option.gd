extends Control

var eco_percent: float = 2
var panel_price: float = 5000
var number_of_panels: int = 0

@onready var solar_panel_price_label: Label = $SolarPanelPriceLabel
@onready var solar_panel_eco_label: Label = $SolarPanelEcoLabel
@onready var solar_panel_quantity_label: Label = $SolarPanelQuantityLabel


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	number_of_panels += 1
	solar_panel_quantity_label.text = "Amount: " + str(number_of_panels)



func get_eco_percent():
	return eco_percent
	
func get_price():
	return panel_price
	
func get_number_of_panels():
	return number_of_panels
