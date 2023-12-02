extends Control

const MAX_LINES: int = 35

var text_buffer: PackedStringArray = []
var key_code_buffer: Dictionary = {}

@onready var label: Label = $Label
@onready var buttons: Array[CheckButton] = [
	$Buttons/ControllerButton_0 as CheckButton,
	$Buttons/ControllerButton_1 as CheckButton,
	$Buttons/ControllerButton_2 as CheckButton,
	$Buttons/ControllerButton_3 as CheckButton,
	$Buttons/ControllerButton_4 as CheckButton,
	$Buttons/ControllerButton_5 as CheckButton,
	$Buttons/ControllerButton_6 as CheckButton,
	$Buttons/ControllerButton_7 as CheckButton,
	$Buttons/ControllerButton_8 as CheckButton,
	$Buttons/ControllerButton_9 as CheckButton,
	$Buttons/ControllerButton_10 as CheckButton,
	$Buttons/ControllerButton_11 as CheckButton,
	$Buttons/ControllerButton_12 as CheckButton,
	$Buttons/ControllerButton_13 as CheckButton,
	$Buttons/ControllerButton_14 as CheckButton,
]
@onready var axes: Array[HSlider] = [
	$Axes/ControllerAxis_0/HSlider as HSlider,
	$Axes/ControllerAxis_1/HSlider as HSlider,
	$Axes/ControllerAxis_2/HSlider as HSlider,
	$Axes/ControllerAxis_3/HSlider as HSlider,
	$Axes/ControllerAxis_4/HSlider as HSlider,
	$Axes/ControllerAxis_5/HSlider as HSlider,
]
@onready var keycodes: Label = $Keyboard/KeyCodes


func _ready() -> void:
	text_buffer.push_back("OS: " + OS.get_name())
	text_buffer.push_back("Distro: " + OS.get_distribution_name())
	text_buffer.push_back("CPU: " + OS.get_processor_name())
	text_buffer.push_back("GPU: " + RenderingServer.get_rendering_device().get_device_name())
	label.text =  "\n".join(text_buffer)


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Ignore the mouse leaving and entering the window
		pass
	
	elif event is InputEventJoypadButton:
		buttons[event.button_index].button_pressed = event.pressed

	elif event is InputEventJoypadMotion:
		axes[event.axis].value = event.axis_value
	
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
		text_buffer.push_back(str(event))
		while len(text_buffer) > MAX_LINES:
			text_buffer.remove_at(0)
		label.text =  "\n".join(text_buffer)

