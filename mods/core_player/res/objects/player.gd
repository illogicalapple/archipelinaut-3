extends CharacterBody2D

@export var SPEED = 300.0
@onready var utils = UtilLoader.new([&"core_vfx:movement"], self).utils

var movement_anim

func _ready() -> void:
	movement_anim = utils[&"core_vfx:movement"]

func _process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = direction * SPEED
	movement_anim.is_moving = velocity != Vector2.ZERO
	move_and_slide()
