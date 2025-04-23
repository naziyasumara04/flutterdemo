import 'package:flutter/material.dart';
import 'package:practice_project/provider/user_provider.dart';
import 'package:practice_project/screens/show_name_screen.dart';
import 'package:provider/provider.dart';

class AddNameScreen extends StatefulWidget {
  const AddNameScreen({super.key});

  @override
  State<AddNameScreen> createState() => _AddNameScreenState();
}

class _AddNameScreenState extends State<AddNameScreen> {
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.watch<UserProvider>().name),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "enter name",
              labelText: "enter name",
            ),
          ),
          ElevatedButton(
            onPressed: () {
              context.read<UserProvider>().updateName(
                newName: nameController.text,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShowNameScreen()),
              );
            },
            child: Text("save and move"),
          ),
        ],
      ),
    );
  }
}
