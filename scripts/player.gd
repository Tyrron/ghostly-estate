extends CharacterBody2D

@export var speed: int = 1
@export var wait_frames: int = 1
var lock_move = false
var wait: int = 0

signal moved(position: Vector2, cursor_position: Vector2)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animatedSprite.play("idle")
	pass # Replace with function body.
	
func _physics_process(delta: float) -> void:
	if lock_move:
		wait += 1
		if wait % wait_frames == 0:
			wait = 0
			lock_move = false
		return
	
	velocity = Vector2.ZERO
	var direction = Vector2(0, 0)
	
	if Input.is_action_pressed("left"):
		direction = Vector2(-1, 0)
		$Sprite2D.flip_h = true
	if Input.is_action_pressed("right"):
		direction = Vector2(1, 0)
		$Sprite2D.flip_h = false
	if Input.is_action_pressed("up"):
		direction = Vector2(0, -1)
	if Input.is_action_pressed("down"):
		direction = Vector2(0, 1)
	
	velocity = speed * direction
	position += velocity.normalized()
	
	if velocity != Vector2.ZERO:
		$Cursor.position = Vector2(direction.x * Globals.grid_size, direction.y * Globals.grid_size)
		moved.emit(position, $Cursor.position)
		lock_move = true
