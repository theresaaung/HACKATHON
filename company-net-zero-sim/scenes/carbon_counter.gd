extends Node2D
@onready var carbon_label: Label = $CarbonLabel

func update_label(total_carbon):
	carbon_label.text = str(total_carbon) + " Tonnes"
