extends CharacterBody2D

@onready var utils = UtilLoader.new([&"core_vfx:movement"], $Sprite2D).utils

var movement_anim

func _ready() -> void:
	movement_anim = utils[&"core_vfx:movement"]
