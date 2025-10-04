# Godot Faker

🚧 **Work in Progress** - This extension is currently in development.

A Godot Engine plugin that generates realistic fake data including names, identities, and other mock information. Perfect for creating NPCs, generating random information, testing, prototyping, populating databases and generating placeholder content for any project that needs realistic random data.

## Features

- **Random Identity Generation**: Create realistic fake identities with names, usernames, and personal data
- **Fake Data Provider**: Generate mock data for testing databases, user interfaces, and applications
- **Person Data**: Generate realistic names, usernames, and personal information
- **Locale Support**: Currently supports English (en_US) with plans for more locales
- **Seeded Generation**: Reproducible data generation for consistent testing
- **Easy Integration**: Simple API that integrates seamlessly with Godot projects

## Installation

1. Download or clone this repository
2. Copy the `addons/godot_faker` folder to your project's `addons/` directory
3. Enable the plugin in Project Settings > Plugins

## Quick Start

```gdscript
extends Control

func _ready():
    var faker = Faker.new()
    
    # Generate random identity data
    print(faker.person.first_name())     # "Emma"
    print(faker.person.last_name())      # "Johnson"
    print(faker.person.full_name())      # "Liam Smith"
    print(faker.person.username())       # "emma_johnson123"
    
    # Create fake user profiles
    for i in range(5):
        var fake_user = {
            "name": faker.person.full_name(),
            "username": faker.person.username(),
            "first_name": faker.person.first_name(),
            "last_name": faker.person.last_name()
        }
        print(fake_user)
    
    # Generate gender-specific names for characters/NPCs
    print(faker.person.first_name("male"))    # "William"
    print(faker.person.first_name("female"))  # "Sophia"
```

## Available Providers

### PersonProvider
- `first_name(gender = null)` - Generate first names (optionally specify "male" or "female")
- `last_name()` - Generate last names
- `full_name(gender = null)` - Generate full names
- `username()` - Generate usernames (firstname_lastname + number)

## Configuration

### Seeding
Set a seed for reproducible results:
```gdscript
var faker = Faker.new()
faker.seed(12345)  # All subsequent calls will use this seed
```

### Locale Support
```gdscript
var faker = Faker.new("en_US")  # Default locale
faker.set_locale("en_US")       # Change locale dynamically
```

## Development Status

This plugin is in early development. Currently implemented:
- ✅ Random identity and person data generation
- ✅ Fake name generation (first, last, full names)
- ✅ Username generation
- ✅ Locale system foundation
- ✅ Seeded random generation for reproducible fake data

Planned features:
- 📋 Additional identity data
- 📋 More locales and languages
- 📋 Game-specific data (item names, ...)
- 📋 Business data (company names, job titles)
- 📋 Internet data
- 📋 Custom data providers

## Contributing

This project is open for contributions! Feel free to:
- Report bugs and issues
- Suggest new features
- Submit pull requests
- Add new locales and data sets

## License

MIT License. See `LICENSE` file for details.
## Credits

Created by Patzi275
