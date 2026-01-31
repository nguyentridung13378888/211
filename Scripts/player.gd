extends CharacterBody2D

const SPEED = 150.0

@onready var sprite := $AnimatedSprite2D

func _physics_process(_delta: float) -> void:
	velocity = Vector2.ZERO

	var input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	)

	if input_vector != Vector2.ZERO:
		input_vector = input_vector.normalized()
		velocity = input_vector * SPEED

		# --- Animation ---
		sprite.play("walk")

		# Flip khi đi trái / phải
		if input_vector.x != 0:
			sprite.flip_h = input_vector.x < 0

	else:
		sprite.play("idle")

	move_and_slide()
