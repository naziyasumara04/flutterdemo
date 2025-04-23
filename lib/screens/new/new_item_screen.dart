import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practice_project/screens/new/new_cart_screen.dart';
import '../../model/item_model.dart';
import '../../provider/item_provider.dart';
import '../../services/item_services.dart';

class NewItemScreen extends StatefulWidget {
  const NewItemScreen({super.key});

  @override
  State<NewItemScreen> createState() => _NewCartScreenState();
}

class _NewCartScreenState extends State<NewItemScreen> {
  late Future<List<ItemModel>> ItemData;

  // Set<int> selectedIndices = {};

  @override
  void initState() {
    final selectedIndices = context.read<ItemProvider>().selectedIndices;
    ItemData = ItemServices().getItemServices(
      onPressed: onPressed,
      selectedIndices: selectedIndices,
    );
    super.initState();
  }

  // void onPressed(int index) {
  //   if (!selectedIndices.contains(index)) {
  //     setState(() {
  //       selectedIndices.add(index);
  //       // Re-fetch with updated selection
  //       ItemData = ItemServices().getItemServices(
  //         onPressed: onPressed,
  //         selectedIndices: selectedIndices,
  //       );
  //
  //     });
  //   }
  // }
  void onPressed(int index) {
    context.read<ItemProvider>().selectItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Cart Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NewCartScreen()),
              );
            },
            color: Colors.white,
            icon: Icon(Icons.shopping_cart),
          ),
        ],
        backgroundColor: Colors.black,
      ),

      body: FutureBuilder<List<ItemModel>>(
        future: ItemData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No data found"));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final data =
                  snapshot
                      .data![index]; // make sure your data is an object, not a widget

              return ItemModel(
                num: data.num,
                // or data['id'] if it's a Map
                title: data.title,
                // or data['first_name']
                iconOne: Icons.ac_unit,
                iconTwo: Icons.check,
                itemSelected: context
                    .watch<ItemProvider>()
                    .selectedIndices
                    .contains(data.num),
                onPressed: () {
                  context.read<ItemProvider>().selectItem(data.num);
                },
              );
            },
          );
        },
      ),
    );
  }
}
