extends Node2D
@onready var money_cntr: Label = $money_cntr


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
	
func money_contr(total_money):
	money_cntr.text = "$" + str(total_money)
