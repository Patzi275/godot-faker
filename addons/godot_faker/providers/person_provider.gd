class_name PersonProvider
extends BaseProvider

# Override
func _get_module_name() -> String:
	return "person"

# Main 
func first_name(sex = null) -> String:
	if sex == "male":
		return random_element(get_locale_array("first_name.male"))
	elif sex == "female":
		return random_element(get_locale_array("first_name.female"))
	else:
		var all_names = get_locale_array("first_name.male") + \
						get_locale_array("first_name.female") + \
						get_locale_array("first_name.generic")
		return random_element(all_names)

func last_name() -> String:
	return random_element(get_locale_array("last_name.generic"))

func full_name(gender = null) -> String:
	return first_name(gender) + " " + last_name()

func username() -> String:
	# Combine first name + last name + number
	var first = first_name().to_lower()
	var last = last_name().to_lower()
	var num = _rng.randi_range(0, 999)
	
	var patterns = [
		first + last + str(num),
		first + "." + last,
		first + "_" + last + str(num),
		last + first[0] + str(num)
	]
	
	return random_element(patterns)
