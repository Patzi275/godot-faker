extends Control

func _ready() -> void:
	Faker.set_locale("fr_FR")
	%FirstNameLabel.text = Faker.first_name()
