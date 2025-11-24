extends KinematicBody2D

# Variáveis
var velocidade = 200  # Velocidade de movimento
var direcao = Vector2()  # Direção do movimento

# Referências
@onready var sprite = $AnimatedSprite2D  # O nó do Sprite do personagem

func _ready():
	pass

func _process(delta):
	# Captura a entrada do teclado
	direcao = Vector2()

	# Movimentação com as setas do teclado ou WASD
	if Input.is_action_pressed("ui_up"):
		direcao.y = -1
	if Input.is_action_pressed("ui_down"):
		direcao.y = 1
	if Input.is_action_pressed("ui_left"):
		direcao.x = -1
	if Input.is_action_pressed("ui_right"):
		direcao.x = 1

	# Normalizar a direção para não mover mais rápido na diagonal
	direcao = direcao.normalized()

	# Movimento com colisão
	move_and_slide(direcao * velocidade)

	# Atualizar animações baseadas na direção
	_atualizar_animacao(direcao)

# Função para atualizar a animação
func _atualizar_animacao(direcao):
	if direcao == Vector2(0, -1):  # Para cima
		sprite.play("walk_up")
	elif direcao == Vector2(0, 1):  # Para baixo
		sprite.play("walk_down")
	elif direcao == Vector2(-1, 0):  # Para esquerda
		sprite.play("walk_left")
	elif direcao == Vector2(1, 0):  # Para direita
		sprite.play("walk_right")
	else:
		sprite.play("idle")  # Se não houver movimento, exibe a animação de idle
