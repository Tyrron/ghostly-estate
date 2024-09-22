extends CharacterBody2D

var SPEED = 10;
var onTarget = false;
 
@export var target_tile : Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	velocity = Vector2.ZERO;
	$AnimatedSprite2D.play("idle_walk")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	move(target_tile,delta)
	pass

func move(target,delta):

	var direction = ( target - position ).normalized();
	velocity = direction * SPEED
	move_and_slide();
	var collision = get_last_slide_collision();
	print(collision);
	
