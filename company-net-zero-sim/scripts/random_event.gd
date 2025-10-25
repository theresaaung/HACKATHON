extends Node2D

@onready var scroll_container: ScrollContainer = $ScrollContainer
@onready var label: Label = $Label


var messages := [
	"The local eco farm that you have been sourcing food from has got mad cow disease! Results in lower profits from less food.",
	"Week-long storm, no sunlight for a week, cant use solar panels.",
	"The supplier of biodegradable packaging goes bankrupt. Hence, the supermarkets have to switch back to using plastic alternatives.",
	"Recycling workers go on a strike due to low wage and hence all the recycling piles up.",
	"A food bank that the supermarket donates to has reached capacity. Hence, unsold food needs to be thrown away increasing disposable costs.",
	"New eco-friendly food absorbs moisture and damages food.",
	"A fuel shortage hits the country due to which electric vans became overused and difficult to recharge causing delays.",
	"Droughts in Spain ruin crops that the supermarket imports like tomatoes and hence price rises, availability falls and profits decline.",
	"Political conflicts disturb shipping routes, hence imported eco crops decline and forcing the supermarket to go back to non sustainable options."
]

func random_message() -> String:
	var random_message = messages.pick_random()
	messages.erase(random_message)
	if messages.size() > 0:
		return messages.pick_random()
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
	
	
	
