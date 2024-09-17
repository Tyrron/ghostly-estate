extends CharacterBody2D

@export var speed: int = 1
@export var wait_frames: int = 1
var lock_move = false
var wait: int = 0

@onready var animatedSprite = $Sprite2D;

signal moved(position: Vector2, direction: Vector2)
signal enter_manor(inManor: bool);
signal action(position: Vector2, cell_position: Vector2i)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if %DayManager.night == false :
		animatedSprite.play("idle")
	else : 
		animatedSprite.play("idle_night")
	
func _physics_process(_delta: float) -> void:
	if Input.is_action_just_released("action"):
		action.emit(%Cursor.position, %Cursor.cell_position)
		
	if lock_move:
		wait += 1
		if wait % wait_frames == 0:
			wait = 0
			lock_move = false
		return
	
	velocity = Vector2.ZERO
	var direction = Vector2(0, 0)
	if %DayManager.menu_open == false :
		if Input.is_action_pressed("left"):
			direction = Vector2(-1, 0)
			if %DayManager.night == false :
				animatedSprite.play("walk_right")
			else : 
				animatedSprite.play("walk_right_night")
			$Sprite2D.flip_h = true
		if Input.is_action_pressed("right"):
			direction = Vector2(1, 0)
			if %DayManager.night == false :
				animatedSprite.play("walk_right")
			else : 
				animatedSprite.play("walk_right_night")
			$Sprite2D.flip_h = false
		if Input.is_action_pressed("up"):
			direction = Vector2(0, -1)
		if Input.is_action_pressed("down"):
			direction = Vector2(0, 1)
	
	velocity = speed * direction
	move_and_collide(velocity.normalized())
	
	if velocity != Vector2.ZERO:
		moved.emit(position, direction)
		lock_move = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Player':
		enter_manor.emit(true)
		%DayManager.set_night(true)

func _on_night_begin() -> void:
		animatedSprite.play("idle_night");

func _on_night_end() -> void:
		animatedSprite.play("idle");
