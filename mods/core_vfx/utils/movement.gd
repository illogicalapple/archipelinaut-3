extends Utility

## Speed scale of the animation (1 is a speed of 0.2s/waddle)
@export var speed_scale: float = 1.0:
	set(new_speed_scale):
		speed_scale = new_speed_scale
		_movement_tween.set_speed_scale(speed_scale)

## Change this value to toggle waddling animation.
var is_moving: bool = false: set = set_moving

var _movement_tween: Tween
func _ready() -> void:
	_movement_tween = get_tree().create_tween() \
		.set_speed_scale(speed_scale) \
		.set_ease(Tween.EASE_IN_OUT) \
		.set_trans(Tween.TRANS_CUBIC) \
		.set_loops() \
		.tween_property((_target as Node2D), "rotation_degrees", 10, 0.2) \
		.tween_property((_target as Node2D), "rotation_degrees", -10, 0.2)
#	_movement_tween.pause()

func set_moving(new_moving: bool = true) -> void:
	if is_moving == new_moving: return
	is_moving = new_moving

	if not _movement_tween: return
	if is_moving:
		return _movement_tween.start()
	# else:
	_movement_tween.pause()
	var reset_tw = get_tree().create_tween() \
		.set_speed_scale(speed_scale) \
		.set_ease(Tween.EASE_IN_OUT) \
		.set_trans(Tween.TRANS_CUBIC) \
		.tween_property((_target as Node2D), "rotation_degrees", 0, 0.2)