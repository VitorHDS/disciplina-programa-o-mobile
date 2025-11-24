extends CharacterBody2D

# Velocidade de movimento
@export var speed: float = 200.0

# Referência ao AnimatedSprite2D
@onready var anim_sprite: AnimatedSprite2D = $AnimatedSprite2D

func get_input():
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	_update_animation(input_direction)
	

func _physics_process(delta: float) -> void:
	get_input()
	move_and_slide()
	# Atualiza animação conforme direção

	
func _update_animation(direction: Vector2) -> void:
	if direction == Vector2.ZERO:
		anim_sprite.stop()
		
	if direction.x > 0:
		anim_sprite.play("walk_right")
	else:
		anim_sprite.play("walk_left")
	if direction.y > 0:
		anim_sprite.play("walk_down")
	else:
		anim_sprite.play("walk_up")
