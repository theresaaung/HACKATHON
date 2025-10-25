extends Node2D

@onready var button: Button = $Button
@onready var eco_button: Button = $EcoButton                          
@onready var notify_panel: PanelContainer = $PanelContainer            
@onready var notify_label: Label = $PanelContainer/Label               
@onready var feed_scroll: ScrollContainer = $FeedScroll
@onready var feed: VBoxContainer = $FeedScroll/Feed
@onready var click: AudioStreamPlayer2D = $Click

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

func _ready() -> void:
	_setup_notification_style()
	notify_panel.visible = false
	eco_button.text = "Eco: --%"    # Initial eco button label

func _on_button_pressed() -> void:
	_show_notification(_random_message())
	click.play()

func _random_message() -> String:
	return messages.pick_random()

func _setup_notification_style() -> void:
	var sb := StyleBoxFlat.new()
	sb.bg_color = Color("#121212")
	sb.corner_radius_top_left = 14
	sb.corner_radius_top_right = 14
	sb.corner_radius_bottom_left = 14
	sb.corner_radius_bottom_right = 14
	sb.set_border_width_all(0)
	sb.shadow_size = 10
	sb.shadow_color = Color(0, 0, 0, 0.5)
	sb.expand_margin_left = 8
	sb.expand_margin_right = 8
	sb.expand_margin_top = 8
	sb.expand_margin_bottom = 8
	notify_panel.add_theme_stylebox_override("panel", sb)

	notify_label.add_theme_color_override("font_color", Color("#FEFEFE"))
	notify_label.add_theme_constant_override("line_spacing", 2)
	notify_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

	notify_panel.add_theme_constant_override("margin_left", 14)
	notify_panel.add_theme_constant_override("margin_right", 14)
	notify_panel.add_theme_constant_override("margin_top", 10)
	notify_panel.add_theme_constant_override("margin_bottom", 10)

	notify_panel.custom_minimum_size = Vector2(520, 0)
	notify_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	feed.add_theme_constant_override("separation", 8)

func _show_notification(text: String) -> void:
	var toast := notify_panel.duplicate() as PanelContainer
	var label := toast.get_node("Label") as Label
	label.text = text
	toast.visible = true
	toast.modulate.a = 0.0
	toast.scale = Vector2(0.98, 0.98)
	toast.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	# Add newest to top
	feed.add_child(toast)
	feed.move_child(toast, 0)

	# Animate a quick fade/scale pop-in
	var tw := create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(toast, "modulate:a", 1.0, 0.18)
	tw.parallel().tween_property(toast, "scale", Vector2.ONE, 0.18)

	await get_tree().process_frame
	feed_scroll.scroll_vertical = 0


# ECO BUTTON


# Creating a uniform style for the button background color
func _apply_button_style(btn: Button, bg: Color) -> void:
	var normal: StyleBoxFlat = StyleBoxFlat.new()
	normal.bg_color = bg
	var hover: StyleBoxFlat = StyleBoxFlat.new()
	hover.bg_color = bg
	var pressed: StyleBoxFlat = StyleBoxFlat.new()
	pressed.bg_color = bg
	var focus: StyleBoxFlat = StyleBoxFlat.new()
	focus.bg_color = bg
	var disabled: StyleBoxFlat = StyleBoxFlat.new()
	disabled.bg_color = bg.darkened(0.2)

	btn.add_theme_stylebox_override("normal", normal)
	btn.add_theme_stylebox_override("hover", hover)
	btn.add_theme_stylebox_override("pressed", pressed)
	btn.add_theme_stylebox_override("focus", focus)
	btn.add_theme_stylebox_override("disabled", disabled)

	btn.add_theme_color_override("font_color", Color(1, 1, 1))
	btn.add_theme_color_override("font_hover_color", Color(1, 1, 1))
	btn.add_theme_color_override("font_pressed_color", Color(1, 1, 1))
	btn.add_theme_color_override("font_focus_color", Color(1, 1, 1))
	btn.add_theme_color_override("font_disabled_color", Color(0.85, 0.85, 0.85))

# Generate a random eco percentage (can replace with real value later)
func _random_eco_value() -> float:
	return randf_range(-100.0, 100.0)

# Main handler for eco button press
func _on_eco_button_pressed() -> void:
	var eco_value: float = _random_eco_value()

	# Update EcoButton text and color
	eco_button.text = "Eco: %s%%" % String.num(eco_value, 2)
	var btn_col: Color
	if eco_value < 0.0:
		btn_col = Color(0.80, 0.12, 0.12)   # red
	else:
		btn_col = Color(0.12, 0.65, 0.12)
	_apply_button_style(eco_button, btn_col)

	# Create an eco panel under latest notification
	var eco_panel: PanelContainer = notify_panel.duplicate() as PanelContainer
	var eco_label: Label = eco_panel.get_node("Label") as Label
	eco_label.text = eco_button.text  # same text as button

	var sb: StyleBoxFlat = StyleBoxFlat.new()
	sb.bg_color = btn_col
	sb.corner_radius_top_left = 14
	sb.corner_radius_top_right = 14
	sb.corner_radius_bottom_left = 14
	sb.corner_radius_bottom_right = 14
	sb.set_border_width_all(0)
	sb.shadow_size = 10
	sb.shadow_color = Color(0, 0, 0, 0.5)
	sb.expand_margin_left = 8
	sb.expand_margin_right = 8
	sb.expand_margin_top = 8
	sb.expand_margin_bottom = 8
	eco_panel.set("theme_override_styles/panel", sb)

	eco_panel.visible = true
	eco_panel.modulate.a = 0.0
	eco_panel.scale = Vector2(0.98, 0.98)
	eco_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	feed.add_child(eco_panel)
	var insert_index: int = (feed.get_child_count() > 0) if 1 else 0
	feed.move_child(eco_panel, insert_index)

	var tw: Tween = create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(eco_panel, "modulate:a", 1.0, 0.18)
	tw.parallel().tween_property(eco_panel, "scale", Vector2.ONE, 0.18)

	await get_tree().process_frame
	feed_scroll.scroll_vertical = 0
