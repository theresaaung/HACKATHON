extends Node
class_name SuperMarket

# Member variables:


# Slider variables
var eco_packaging: int
var eco_recycling: int
var eco_food_import: int


# Purchaes
var solar_panels: int
var wind_turbines: int
var electric_vehicles: int


# Constructor
func _init(eco_packaging, eco_recycling, eco_foot_import):
	self.eco_packaging = eco_packaging
	self.eco_recycling = eco_recycling
	self.eco_food_import = eco_food_import
	
