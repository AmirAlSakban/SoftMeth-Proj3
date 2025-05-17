# Flutter Item Manager

A Flutter application for managing items through a REST API. This app demonstrates CRUD operations with clean UI components.

## Features

- View items in a responsive list view with images
- Create new items with form validation
- Update existing items
- Delete items with confirmation
- Clean and modern Material Design UI

## Screenshots

*(Add screenshots of your application here)*

## API Integration

This app connects to a REST API (using JSONPlaceholder as a demo) to perform the following operations:

- `GET /items` - Fetch all items
- `GET /items/{id}` - Fetch a specific item
- `POST /items` - Create a new item
- `PUT /items/{id}` - Update an existing item
- `DELETE /items/{id}` - Delete an item

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Android Studio / VS Code
- An emulator or physical device for testing

### Installation

1. Clone this repository
   ```
   git clone https://github.com/yourusername/flutter_item_manager.git
   ```

2. Navigate to the project directory
   ```
   cd flutter_item_manager
   ```

3. Install dependencies
   ```
   flutter pub get
   ```

4. Run the app
   ```
   flutter run
   ```

## Project Structure

```
lib/
├── models/          # Data models
│   └── item.dart    # Item model class
├── services/        # API services
│   └── api_service.dart    # API service for CRUD operations
├── widgets/         # Reusable UI components
│   └── item_list.dart    # Item list widget
└── screens/         # App screens
    ├── add_item_widget.dart    # Add item screen
    ├── edit_item_widget.dart   # Edit item screen
    └── item_detail_widget.dart # Item detail screen
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- Flutter team for creating an amazing framework
- JSONPlaceholder for the free fake API for testing and prototyping
