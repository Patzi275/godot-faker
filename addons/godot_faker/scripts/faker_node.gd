extends Node

class_name FakerNode

enum Gender { Any, Male, Female }

var _data = {
	"en_US": {
		"male_first_names": ["John", "Michael", "William"],
		"female_first_names": ["Mary", "Patricia", "Linda"],
		"last_names": ["Smith", "Johnson", "Williams"],
		"email_domains": ["example.com", "test.com", "demo.com"]
	}
}

var _locale: String = "en_US"
var _gender: Gender = Gender.Any
var _rng: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready() -> void:
	_rng.randomize()

# Set the locale for data generation (e.g., "en_US")
func set_locale(locale: String) -> FakerNode:
	if locale in _data.keys():
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
		names = _data[_locale]["male_first_names"]
	elif _gender == Gender.Female:
		names = _data[_locale]["female_first_names"]
	else:
		names = _data[_locale]["male_first_names"] + _data[_locale]["female_first_names"]
	return _pick_random(names)

# Generate a random last name
func last_name() -> String:
	var names = _data[_locale]["last_names"]
	return _pick_random(names)

# Generate a random full name
func full_name() -> String:
	return "%s %s" % [first_name(), last_name()]

# Generate a random email
func email() -> String:
	var first = first_name().to_lower().replace(" ", "")
	var last = last_name().to_lower().replace(" ", "")
	var domain = _data[_locale]["email_domains"][_rng.randi_range(0, _data[_locale]["email_domains"].size() - 1)]
	return "%s.%s@%s" % [first, last, domain]

func _pick_random(list: Array):
	return list[_rng.randi_range(0, list.size() - 1)]
