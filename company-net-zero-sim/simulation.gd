extends Node2D



@onready var packaging_option: Control = $PackagingOption
@onready var recycling_option: Control = $RecyclingOption
@onready var food_option: Control = $FoodOption

# Slider variables

var total_eco_percent: float
var total_profit_percent: float


@onready var profit: Label = $profit
@onready var eco: Label = $eco




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	calculate_total_percents()
	eco.text = "Eco: " + str(total_eco_percent) + "%"
	profit.text = "Profit: " + str(total_profit_percent) + "%"


func calculate_total_percents():
	total_eco_percent = packaging_option.get_eco_percent() + recycling_option.get_eco_percent() + food_option.get_eco_percent()
	total_profit_percent = packaging_option.get_profit_percent() + recycling_option.get_profit_percent() + food_option.get_profit_percent()
