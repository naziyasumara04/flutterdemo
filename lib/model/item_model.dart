import 'package:flutter/material.dart';

class ItemModel extends StatelessWidget {
  final int num;
  final String title;
  final IconData iconOne;
  final IconData iconTwo;
  final bool itemSelected;
  final VoidCallback onPressed;

  ItemModel({
    required this.num,
    required this.title,
    required this.iconOne,
    required this.iconTwo,
    required this.itemSelected,
    required this.onPressed,
  });

  factory ItemModel.fromJson(
  {required Map<String, dynamic> json,
    required bool itemSelected,
    required  VoidCallback onPressed,}
  ) {
    return ItemModel(
      num: json['id'],

      title: json['first_name'],
      iconOne: Icons.ac_unit,
      iconTwo: Icons.check,
      itemSelected: itemSelected,
      onPressed: onPressed,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text('$num'),
      title: Text(title),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(itemSelected ? iconTwo : iconOne),
      ),
    );
  }
}
