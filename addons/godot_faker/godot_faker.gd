@tool
extends EditorPlugin

const ICON = preload("res://addons/godot_faker/icon.svg")
const FakerNode = preload("res://addons/godot_faker/scripts/faker_node.gd")

func _enter_tree() -> void:
	add_custom_type("FakerNode", "Node", FakerNode, ICON)
	add_autoload_singleton("Faker", "res://addons/godot_faker/scripts/faker_node.gd")

func _exit_tree() -> void:
	remove_custom_type("FakerNode")
	remove_autoload_singleton("Faker")
