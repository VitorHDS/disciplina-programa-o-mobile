extends ColorRect

@export var value := 50.0
@export var max_value := 100.0
@export var min_value := 0.0

func _ready(): set_value(value)

func set_value(new_value:float):
 value = clamp(new_value, min_value, max_value)
 material.set_shader_parameter("value", value / (max_value - min_value))

func _process(delta: float):
 if Input.is_action_just_pressed("ui_accept"): set_value(value + 10)
