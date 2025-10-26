extends Node2D

@onready var label: Label = $Label                   

var random_list
var profit_value: float
var eco_value: float
var option: String

var messages := [["The local eco farm that you have been sourcing food from has got mad cow disease! Results in lower profits from less food.", 0.4, 0.3, "FOOD"],
	["New partnership with nearby dairy farms leading to the growth of local milk supply.", 0.2, 0.3, "FOOD"],
	["The supplier of biodegradable packaging goes bankrupt. Hence, the supermarkets have to switch back to using plastic alternatives.", 0.5, 0.5, "PACKAGING"],
	["Recycling workers go on a strike and hence all the recycling piles up.", 0.6, 0.4, "RECYCLE"],
	["Government subsidies announced for recycling", 0.2, 0.6, "RECYCLE"],
	["Packaging redesign reduces material use by 30%.", 0.04, 0.2, "PACKAGING"],
	["A food bank that the supermarket donates to has reached capacity. Hence, unsold food needs to be thrown away increasing disposable costs.", 0.5, 0.3, "RECYCLE"], 
	["New eco-friendly food absorbs moisture and damages food.", 0.4, 0.3, "PACKAGING"],
	["Launch “Bring Your Own Bag” campaign", 0.04, 0.2, "PACKAGING"],
	["Droughts in Spain ruin crops that the supermarket imports hence local suppy increases.", 0.2, 0.3, "FOOD"],
	["Political conflicts disturb shipping routes improving local sustainable options.", 0.2, 0.4, "FOOD"]]


func random_message() -> String:
	random_list = messages.pick_random()
	var random_message = random_list[0]
	messages.erase(random_list)
	if messages.size() > 0:
		return  random_message
	else:
		return ""


	
func random_event_text(year) -> void:
	var text = random_message()
	# Append new text
	label.text += "<" + str(year) + "> "
	label.text += text + "\n" 
	
	# Wait for layout to update before scrolling
	await get_tree().process_frame
	
	
func eco_update_text() -> void:
	var profit_value: float = random_list[1]
	var eco_value: float = random_list[2]
	var option: String = random_list[3]
	# Append new text
	
	label.text += option[0].to_upper() + option.substr(1,-1).to_lower() + " option affected range. "
	label.text += "Profit: " + str(profit_value*50) + "% Eco: " + str(eco_value*50) + "%" + "\n" + "\n"
	
	#if eco_value < 0.0:
		#label.modulate = Color(0.80, 0.12, 0.12)   # red
	#else:
		#label.modulate = Color(0.12, 0.65, 0.12)
	
	# Wait for layout to update before scrolling
	await get_tree().process_frame
	
	
func get_values_to_change_option():
	return random_list
