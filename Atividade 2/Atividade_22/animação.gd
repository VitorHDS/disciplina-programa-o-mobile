extends Node2D

@onready var sprite = $AnimatedSprite2D
@onready var toggle_button = $Button

const nome_animação := "default"

func _ready():
	toggle_button.pressed.connect(_on_toggle_animation)
	_update_button_text()

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		_toggle_animation()

func _on_toggle_animation():
	_toggle_animation()
	toggle_button.release_focus()
	
func _toggle_animation():
	if sprite.is_playing():
		sprite.stop()
	else:
		sprite.play(nome_animação)
	_update_button_text()

func _update_button_text():
	if sprite.is_playing():
		toggle_button.text = "Parar Animação"
	else:
		toggle_button.text = "Executar Animação"
