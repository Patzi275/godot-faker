class_name Faker
extends RefCounted

var person: PersonProvider

var _locale: String

func _init(locale: String = "en_US"):
	_locale = locale
	_initialize_providers()
	_load_locale(locale)

func _load_locale(locale: String):
	person.load_locale_data(locale)

func _initialize_providers():
	person = PersonProvider.new(self)

# To change the local smoothly
func set_locale(locale: String):
	_locale = locale
	_load_locale(locale)
	_initialize_providers()

# Global seed for all providers
func seed(value: int):
	person.seed(value)
