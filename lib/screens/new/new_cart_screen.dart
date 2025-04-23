import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/item_provider.dart';

class NewCartScreen extends StatefulWidget {
  const NewCartScreen({super.key});

  @override
  State<NewCartScreen> createState() => _NewCartScreenState();
}

class _NewCartScreenState extends State<NewCartScreen> {
  @override
  Widget build(BuildContext context) {
    final selectedItems = context.watch<ItemProvider>().selectedIndices;
    return Scaffold(
      appBar: AppBar(title: Text("Cart"), backgroundColor: Colors.black),
      body:
          selectedItems.isEmpty
              ? Center(child: Text("No items selected"))
              : ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  final itemIndex = selectedItems.elementAt(index);
                  return ListTile(
                    title: Text("Selected Item ID: $itemIndex"),
                    trailing: Icon(Icons.check, color: Colors.green),
                  );
                },
              ),
    );
  }
}
