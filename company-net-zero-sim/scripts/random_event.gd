extends Node2D

@onready var label: Label = $Label                   


var messages := [["The local eco farm that you have been sourcing food from has got mad cow disease! Results in lower profits from less food.", 0.4, 0.3],
	["New partnership with nearby dairy farms leading to the growth of local milk supply.", 0.2, 0.3],
	["The supplier of biodegradable packaging goes bankrupt. Hence, the supermarkets have to switch back to using plastic alternatives.", 0.5, 0.5],
	["Recycling workers go on a strike and hence all the recycling piles up.", 0.6, 0.4],
	["Government subsidies announced for recycling", 0.2, 0.6],
	["Packaging redesign reduces material use by 30%.", 0.04, 0.2],
	["A food bank that the supermarket donates to has reached capacity. Hence, unsold food needs to be thrown away increasing disposable costs.", 0.5, 0.3], 
	["New eco-friendly food absorbs moisture and damages food.", 0.4, 0.3],
	["Launch “Bring Your Own Bag” campaign", 0.04, 0.2],
	["Droughts in Spain ruin crops that the supermarket imports hence local suppy increases.", 0.2, 0.3],
	["Political conflicts disturb shipping routes improving local sustainable options.", 0.2, 0.4]]


func random_message() -> String:
	var random_list = messages.pick_random()
	var random_message = random_list[0]
	messages.erase(random_list)
	if messages.size() > 0:
		return  random_message
	else:
		return ""
	
# Generate a random eco percentage (can replace with real value later)
func _random_eco_value() -> float:
	return randf_range(-100.0, 100.0)

	
func random_event_text(year) -> void:
	var text = random_message()
	# Append new text
	label.text += "<" + str(year) + "> "
	label.text += text + "\n" 
	
	# Wait for layout to update before scrolling
	await get_tree().process_frame
	
	
func eco_update_text() -> void:
	var eco_value: float = _random_eco_value()
	# Append new text
	label.text += str(eco_value) + "\n" + "\n"
	
	#if eco_value < 0.0:
		#label.modulate = Color(0.80, 0.12, 0.12)   # red
	#else:
		#label.modulate = Color(0.12, 0.65, 0.12)
	
	# Wait for layout to update before scrolling
	await get_tree().process_frame
	
	
	
