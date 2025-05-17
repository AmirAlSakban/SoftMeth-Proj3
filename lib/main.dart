import 'package:flutter/material.dart';
import 'package:flutter_item_manager/add_item_widget.dart';
import 'dart:async';
import 'package:flutter_item_manager/models/item.dart';
import 'package:flutter_item_manager/services/api_service.dart';
import 'package:flutter_item_manager/widgets/item_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      home: ItemsListScreen(),
    );
  }
}

class ItemsListScreen extends StatefulWidget {
  @override
  _ItemsListScreenState createState() => _ItemsListScreenState();
}

class _ItemsListScreenState extends State<ItemsListScreen> {
  final ApiService api = ApiService();
  List<Item> itemsList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchItems();
  }

  _fetchItems() async {
    setState(() {
      isLoading = true;
    });

    try {
      final items = await api.getItems();
      setState(() {
        itemsList = items;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${error.toString()}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items Management'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _fetchItems,
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : itemsList.isEmpty
              ? Center(
                  child: Text(
                    'No items found',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                )
              : ItemList(items: itemsList),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemWidget()),
          ).then((value) {
            _fetchItems();
          });
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }
}
