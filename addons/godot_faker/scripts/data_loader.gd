extends RefCounted

static func load_data(lng: String, module: String):
	var file = FileAccess.open("res://addons/godot_faker/data/locales/%s/%s.json" % [lng, module], FileAccess.READ)
	var json
	if file:
		json = JSON.parse_string(file.get_as_text())
	if json is Dictionary:
		file.close()
		return json
	else:
		push_error("Failed to load faker data for language: %s (Module: %s)" % [lng, module])

static func get_available_languages():
	var dir = DirAccess.open("res://addons/godot_faker/data/locales")
	if dir:
		var languages = []
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".json"):
				languages.append(file_name.replace("faker_data_", "").replace(".json", ""))
			file_name = dir.get_next()
		dir.list_dir_end()
		return languages
	else:
		push_error("Failed to open data directory")
