extends Node2D


# Slider options
@onready var packaging_option: Control = $PackagingOption
@onready var recycling_option: Control = $RecyclingOption
@onready var food_option: Control = $FoodOption

# Button options
@onready var solar_panel_option: Control = $SolarPanelOption
@onready var van_option: Control = $VanOption

# Projected outcome label
@onready var projected_outcome_label: Control = $ProjectedOutcomeLabel


# percent variables
var total_eco_percent: float
var total_profit_percent: float

# Total eco and money
var total_money: float = 0
var total_carbon: float = 100000



func calculate_total_percents():
	var solar_eco_effect = (solar_panel_option.get_eco_percent() * solar_panel_option.get_quantity())
	var van_eco_effect = (van_option.get_eco_percent() * van_option.get_quantity())
	total_eco_percent = packaging_option.get_eco_percent() + recycling_option.get_eco_percent() + food_option.get_eco_percent() + solar_eco_effect + van_eco_effect
	total_profit_percent = packaging_option.get_profit_percent() + recycling_option.get_profit_percent() + food_option.get_profit_percent()


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	calculate_total_percents()
	projected_outcome_label.update_label(total_eco_percent, total_profit_percent)
