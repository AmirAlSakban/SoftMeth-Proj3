import 'dart:convert';

import 'package:flutter_restapi/models/item.dart';
import 'package:http/http.dart';

class ApiService {
  // Using JSONPlaceholder API as a demo REST endpoint
  final String apiUrl = "https://jsonplaceholder.typicode.com/posts";

  Future<List<Item>> getItems() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      // Convert the posts from JSONPlaceholder to our Item model
      List<Item> items = body.map((dynamic item) => Item(
        id: item['id'].toString(),
        name: "Item ${item['id']}",
        description: item['title'],
        price: 19.99,
        category: "Category ${item['id'] % 5 + 1}",
        quantity: item['id'] % 20 + 1,
        imageUrl: "https://via.placeholder.com/150",
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
      )).toList();
      return items;
    } else {
      throw "Failed to load items list";
    }
  }

  Future<Item> getItemById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return Item(
        id: data['id'].toString(),
        name: "Item ${data['id']}",
        description: data['title'],
        price: 19.99,
        category: "Category ${data['id'] % 5 + 1}",
        quantity: data['id'] % 20 + 1,
        imageUrl: "https://via.placeholder.com/150",
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
      );
    } else {
      throw Exception('Failed to load an item');
    }
  }

  Future<Item> createItem(Item item) async {
    Map<String, String> headers = {"Content-Type": "application/json"};

    final Response response = await post(
      apiUrl,
      headers: headers,
      body: json.encode(item.toJson()),
    );
    
    if (response.statusCode == 201) {
      var data = json.decode(response.body);
      return Item(
        id: data['id'].toString(),
        name: item.name,
        description: item.description,
        price: item.price,
        category: item.category,
        quantity: item.quantity,
        imageUrl: item.imageUrl,
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
      );
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<Item> updateItem(String id, Item item) async {
    Map<String, String> headers = {"Content-Type": "application/json"};

    final Response response = await put(
      '$apiUrl/$id',
      headers: headers,
      body: json.encode(item.toJson()),
    );
    
    if (response.statusCode == 200) {
      return item;
    } else {
      throw Exception('Failed to update an item');
    }
  }

  Future<void> deleteItem(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Item deleted");
    } else {
      throw "Failed to delete item.";
    }
  }
}
