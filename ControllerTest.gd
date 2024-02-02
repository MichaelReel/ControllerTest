extends Control

const MAX_LINES: int = 35

var text_buffer: PackedStringArray = []
var key_code_buffer: Dictionary = {}

@onready var label: Label = $Label
@onready var buttons_0: Array[CheckButton] = [
	$"Controller_0/ControllerButton_0" as CheckButton,
	$"Controller_0/ControllerButton_1" as CheckButton,
	$"Controller_0/ControllerButton_2" as CheckButton,
	$"Controller_0/ControllerButton_3" as CheckButton,
	$"Controller_0/ControllerButton_4" as CheckButton,
	$"Controller_0/ControllerButton_5" as CheckButton,
	$"Controller_0/ControllerButton_6" as CheckButton,
	$"Controller_0/ControllerButton_7" as CheckButton,
	$"Controller_0/ControllerButton_8" as CheckButton,
	$"Controller_0/ControllerButton_9" as CheckButton,
	$"Controller_0/ControllerButton_10" as CheckButton,
	$"Controller_0/ControllerButton_11" as CheckButton,
	$"Controller_0/ControllerButton_12" as CheckButton,
	$"Controller_0/ControllerButton_13" as CheckButton,
	$"Controller_0/ControllerButton_14" as CheckButton,
]
@onready var buttons_1: Array[CheckButton] = [
	$"Controller_1/ControllerButton_0" as CheckButton,
	$"Controller_1/ControllerButton_1" as CheckButton,
	$"Controller_1/ControllerButton_2" as CheckButton,
	$"Controller_1/ControllerButton_3" as CheckButton,
	$"Controller_1/ControllerButton_4" as CheckButton,
	$"Controller_1/ControllerButton_5" as CheckButton,
	$"Controller_1/ControllerButton_6" as CheckButton,
	$"Controller_1/ControllerButton_7" as CheckButton,
	$"Controller_1/ControllerButton_8" as CheckButton,
	$"Controller_1/ControllerButton_9" as CheckButton,
	$"Controller_1/ControllerButton_10" as CheckButton,
	$"Controller_1/ControllerButton_11" as CheckButton,
	$"Controller_1/ControllerButton_12" as CheckButton,
	$"Controller_1/ControllerButton_13" as CheckButton,
	$"Controller_1/ControllerButton_14" as CheckButton,
]
@onready var buttons: Array[Array] = [buttons_0, buttons_1]
@onready var axes_0: Array[HSlider] = [
	$"Controller_0/ControllerAxis_0/HSlider" as HSlider,
	$"Controller_0/ControllerAxis_1/HSlider" as HSlider,
	$"Controller_0/ControllerAxis_2/HSlider" as HSlider,
	$"Controller_0/ControllerAxis_3/HSlider" as HSlider,
	$"Controller_0/ControllerAxis_4/HSlider" as HSlider,
	$"Controller_0/ControllerAxis_5/HSlider" as HSlider,
]
@onready var axes_1: Array[HSlider] = [
	$"Controller_1/ControllerAxis_0/HSlider" as HSlider,
	$"Controller_1/ControllerAxis_1/HSlider" as HSlider,
	$"Controller_1/ControllerAxis_2/HSlider" as HSlider,
	$"Controller_1/ControllerAxis_3/HSlider" as HSlider,
	$"Controller_1/ControllerAxis_4/HSlider" as HSlider,
	$"Controller_1/ControllerAxis_5/HSlider" as HSlider,
]
@onready var axes: Array[Array] = [axes_0, axes_1]
@onready var keycodes: Label = $Keyboard/KeyCodes

func _ready() -> void:
	text_buffer.push_back("OS: " + OS.get_name())
	text_buffer.push_back("Distro: " + OS.get_distribution_name())
	text_buffer.push_back("CPU: " + OS.get_processor_name())
	text_buffer.push_back("GPU: " + RenderingServer.get_rendering_device().get_device_name())
	label.text =  "\n".join(text_buffer)
	
	Input.connect("joy_connection_changed", self._on_joy_connections_changed)


func _process(_delta: float) -> void:
	if Input.is_action_pressed("back_plate_p1_r4"):
		push_text_to_debug("back_plate_p1_r4")
	if Input.is_action_pressed("back_plate_p1_l4"):
		push_text_to_debug("back_plate_p1_l4")


func _unhandled_input(event: InputEvent) -> void:
	if event.device >= 1:
		push_text_to_debug("three or more devices detected")
	
	if event is InputEventMouseMotion or event is InputEventMouseButton:
		# Ignore the mouse leaving and entering the window and scroll wheel
		pass
	
	elif event is InputEventJoypadButton:
		if event.button_index >= len(buttons[event.device]):
			push_text_to_debug(
				"button index " + str(event.button_index) + " unknown for device " + str(event.device)
			)
		
		buttons[event.device][event.button_index].button_pressed = event.pressed
	
	elif event is InputEventJoypadMotion:
		axes[event.device][event.axis].value = event.axis_value
	
	elif event is InputEventKey:
		if event.pressed:
			key_code_buffer[event.keycode] = (
				str(event.keycode) + " - "
				+ str(event.unicode) + " - "
				+ "'" + char(event.unicode) + "' - "
				+ "\"" + event.as_text_keycode() + "\""
			)
		else:
			key_code_buffer.erase(event.keycode)
			
		keycodes.text = "\n".join(key_code_buffer.values())
	
	else:
		push_text_to_debug(str(event))


func push_text_to_debug(text: String) -> void:
	text_buffer.push_back(text)
	while len(text_buffer) > MAX_LINES:
		text_buffer.remove_at(0)
	label.text =  "\n".join(text_buffer)


func _on_joy_connections_changed(device: int, connected: bool) -> void:
	push_text_to_debug("joy connection changed, device: " + str(device) + ", connected: " + str(connected))
