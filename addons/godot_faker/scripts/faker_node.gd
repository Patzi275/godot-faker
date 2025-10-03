extends Node

class_name FakerNode

enum Gender { Any, Male, Female }

var _data: Dictionary

var _locale: String = "en_US":
	set(value):
		_data = DataLoader.load_data(value)
		_locale = value
var _gender: Gender = Gender.Any
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()
var DataLoader = preload("res://addons/godot_faker/scripts/data_loader.gd")


func _ready() -> void:
	_data = DataLoader.load_data(_locale)
	_rng.randomize()

# Set the locale for data generation (e.g., "en_US")
func set_locale(locale: String) -> FakerNode:
	var languagues_list = DataLoader.get_available_languages()
	if locale in languagues_list:
		_locale = locale
	else:
		push_error("Locale '%s' not supported. Falling back to 'en_US'." % locale)
		_locale = "en_US"
	return self

# Set gender for name generation (e.g., "male", "female", "any")
func set_gender(gender: Gender) -> FakerNode:
	_gender = gender
	return self

# Set seed for deterministic results
func seed(value: int) -> void:
	_rng.seed = value

# Generate a random first name
func first_name() -> String:
	var names: Array
	if _gender == Gender.Male:
		names = _data["male_first_names"]
	elif _gender == Gender.Female:
		names = _data["female_first_names"]
	else:
		names = _data["male_first_names"] + _data["female_first_names"]
	return _pick_random(names)

# Generate a random last name
func last_name() -> String:
	var names = _data["last_names"]
	return _pick_random(names)

# Generate a random full name
func full_name() -> String:
	return "%s %s" % [first_name(), last_name()]

# Generate a random email
func email() -> String:
	var first = first_name().to_lower().replace(" ", "")
	var last = last_name().to_lower().replace(" ", "")
	var domain = _data["email_domains"][_rng.randi_range(0, _data["email_domains"].size() - 1)]
	return "%s.%s@%s" % [first, last, domain]

func _pick_random(list: Array):
	return list[_rng.randi_range(0, list.size() - 1)]
