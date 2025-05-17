// Item model class for managing generic items
class Item {
  final String id;
  final String name;
  final String description;
  final double price;
  final String category;
  final int quantity;
  final String imageUrl;
  final String createdAt;
  final String updatedAt;

  Item({
    this.id,
    this.name,
    this.description,
    this.price,
    this.category,
    this.quantity,
    this.imageUrl,
    this.createdAt,
    this.updatedAt
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] != null ? json['id'].toString() : json['_id'] != null ? json['_id'].toString() : '',
      name: json['name'] as String ?? '',
      description: json['description'] as String ?? '',
      price: json['price'] != null ? (json['price'] is int 
          ? (json['price'] as int).toDouble() 
          : json['price'] as double) : 0.0,
      category: json['category'] as String ?? '',
      quantity: json['quantity'] != null ? json['quantity'] as int : 0,
      imageUrl: json['imageUrl'] as String ?? '',
      createdAt: json['createdAt'] as String ?? '',
      updatedAt: json['updatedAt'] as String ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'quantity': quantity,
      'imageUrl': imageUrl,
    };
  }
}