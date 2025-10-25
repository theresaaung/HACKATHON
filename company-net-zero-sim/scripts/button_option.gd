extends Control
signal update

@export var eco_percent: float = 5
@export var price: float = 5000
var quantity: int = 0


@onready var price_label: Label = $PriceLabel
@onready var eco_label: Label = $EcoLabel
@onready var quantity_label: Label = $QuantityLabel




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	quantity += 1
	quantity_label.text = "Amount: " + str(quantity)
	AudioGlobal.click()
	update.emit()



func get_eco_percent():
	return eco_percent
	
func get_price():
	return price
	
func get_quantity():
	return quantity
