extends Node2D
@onready var money_label: Label = $MoneyLabel
	
func update_label(total_money):
	money_label.text = "$" + str(total_money)
