extends Node2D

@onready var animatedSprite = $Sprite2D

@export var speed = 1

signal moved(position, something)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animatedSprite.play("idle")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("left"):
		velocity.x = -speed
		animatedSprite.play("move_left")
	if Input.is_action_pressed("right"):
		velocity.x = speed
		animatedSprite.play("move_right")
	if Input.is_action_pressed("up"):
		velocity.y = -speed
	if Input.is_action_pressed("down"):
		velocity.y = speed
	position += velocity
	
	if velocity != Vector2.ZERO:
		moved.emit(position, "hello")
