extends RefCounted
class_name BaseProvider

var _rng: RandomNumberGenerator
var _locale_data: Dictionary
var _faker
var DataLoader = preload("res://addons/godot_faker/scripts/data_loader.gd")


func _init(faker_instance):
	_faker = faker_instance
	_rng = RandomNumberGenerator.new()
	_rng.randomize()

# Implemented by children
func _get_module_name() -> String:
	push_error("get_modules() must be implemented by subclasses")
	return ""

func load_locale_data(locale: String):
	_locale_data = DataLoader.load_data(locale, _get_module_name())

func random_element(array: Array):
	if array.is_empty():
		push_error("Cannot get random element from empty array")
		return null
	return array[_rng.randi() % array.size()]

func get_locale_array(path: String) -> Array:
	var keys = path.split(".")
	var current = _locale_data
	
	for key in keys:
		if current.has(key):
			current = current[key]
		else:
			push_warning("Locale path not found: " + path)
			return []
	
	return current if current is Array else []

func seed(value: int):
	_rng.seed = value
