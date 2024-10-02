class_name Utility extends Node

var _target: Node

func _init(target: Node) -> void:
	_target = target

func get_target() -> Node:
	return _target
