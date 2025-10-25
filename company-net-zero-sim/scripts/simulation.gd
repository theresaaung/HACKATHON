extends Node2D

var current_year: int = 2025

# Slider options
@onready var packaging_option: Control = $PackagingOption
@onready var recycling_option: Control = $RecyclingOption
@onready var food_option: Control = $FoodOption

# Button options
@onready var solar_panel_option: Control = $SolarPanelOption
@onready var van_option: Control = $VanOption

# Projected outcome label
@onready var projected_outcome_label: Control = $ProjectedOutcomeLabel

# Counter for total carbon and total money
@onready var money_counter: Node2D = $MoneyCounter
@onready var carbon_counter: Node2D = $CarbonCounter

# percent variables
var total_eco_percent: float
var total_profit_percent: float

# Total eco and money
@export var total_money: float = 100000
@export var total_carbon: float = 100000


#Random Event Console
@onready var random_event: Node2D = $RandomEvent

@onready var current_year_label: Label = $CurrentYearLabel

func calculate_total_percents():
	var solar_eco_effect = (solar_panel_option.get_eco_percent() * solar_panel_option.get_quantity())
	var van_eco_effect = (van_option.get_eco_percent() * van_option.get_quantity())
	total_eco_percent = packaging_option.get_eco_percent() + recycling_option.get_eco_percent() + food_option.get_eco_percent() + solar_eco_effect + van_eco_effect
	total_profit_percent = packaging_option.get_profit_percent() + recycling_option.get_profit_percent() + food_option.get_profit_percent()




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	carbon_counter.update_label(total_carbon)
	money_counter.update_label(total_money)
	current_year_label.text = str("Current Year: " + str(current_year))
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	calculate_total_percents()
	
	total_money = total_money
	
	projected_outcome_label.update_label(total_eco_percent, total_profit_percent)
	money_counter.update_label(total_money)

	

func _on_step_button_pressed() -> void:
	AudioGlobal.click()
	
	# Move 5 years
	current_year += 5
	current_year_label.text = str("Current Year: " + str(current_year))
	
	# Show random event messege
	random_event.random_event_text(current_year)
	random_event.eco_update_text()
	# Update money
	total_money = round(total_money * (total_profit_percent *0.01+1))
	money_counter.update_label(str(total_money))

	
	# Update carbon
	total_carbon = round(total_carbon * (1-(total_eco_percent*0.01)))
	carbon_counter.update_label(str(total_carbon))
	

	
	if current_year == 2050:
		pass
		# load to end screen with adjust money 
	
	


func _on_solar_panel_option_update() -> void:
	total_money -= solar_panel_option.get_price()


func _on_van_option_update() -> void:
	total_money -= van_option.get_price()
