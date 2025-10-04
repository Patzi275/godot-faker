extends Control

func _ready() -> void:
	var faker = Faker.new()
	%FirstNameLabel.text = faker.person.username()
