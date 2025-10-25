extends Node2D
	
@onready var button: Button = $Button
@onready var template_panel: PanelContainer = $PanelContainer
@onready var template_label: Label = $PanelContainer/Label
@onready var click: AudioStreamPlayer2D = $Click

var feed_scroll: ScrollContainer
var feed: VBoxContainer
  
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
	_style_template()
	template_panel.visible = false  # hide the dark rectangle

	_create_feed()
	_resize_feed_to_viewport()      # give it a real size under Node2D
	get_viewport().size_changed.connect(_resize_feed_to_viewport)

	button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
	_add_notification(messages.pick_random())
	click.play()


func _style_template() -> void:
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
	template_panel.add_theme_stylebox_override("panel", sb)

	template_label.add_theme_color_override("font_color", Color("#FEFEFE"))
	template_label.add_theme_constant_override("line_spacing", 2)
	template_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART

	template_panel.add_theme_constant_override("margin_left", 14)
	template_panel.add_theme_constant_override("margin_right", 14)
	template_panel.add_theme_constant_override("margin_top", 10)
	template_panel.add_theme_constant_override("margin_bottom", 10)

	template_panel.custom_minimum_size = Vector2(520, 0)
	template_panel.size_flags_horizontal = Control.SIZE_EXPAND_FILL


func _create_feed() -> void:
	feed_scroll = ScrollContainer.new()
	feed_scroll.name = "FeedScroll"
	add_child(feed_scroll)

	feed = VBoxContainer.new()
	feed.name = "Feed"
	feed.size_flags_horizontal = Control.SIZE_EXPAND_FILL
	feed.add_theme_constant_override("separation", 8)
	feed_scroll.add_child(feed)


func _resize_feed_to_viewport() -> void:
	var vp := get_viewport_rect().size
	
	var left := 16.0
	var right := 16.0
	var top := 80.0
	var bottom := 16.0

	feed_scroll.position = Vector2(left, top)
	feed_scroll.size = Vector2(max(200.0, vp.x - (left + right)),
							   max(120.0, vp.y - (top + bottom)))


func _add_notification(text: String) -> void:
	var toast := template_panel.duplicate() as PanelContainer
	toast.visible = true
	toast.modulate.a = 0.0
	toast.scale = Vector2(0.98, 0.98)
	toast.size_flags_horizontal = Control.SIZE_EXPAND_FILL

	var label := toast.get_node("Label") as Label
	label.text = text

	feed.add_child(toast)
	feed.move_child(toast, 0)  

	var tw := create_tween().set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_OUT)
	tw.tween_property(toast, "modulate:a", 1.0, 0.18)
	tw.parallel().tween_property(toast, "scale", Vector2.ONE, 0.18)

	await get_tree().process_frame
	feed_scroll.scroll_vertical = 0
