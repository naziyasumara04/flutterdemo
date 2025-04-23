import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/item_model.dart';

class ItemServices {
  final String baseUrl = "https://reqres.in/api/";

  Future<List<ItemModel>> getItemServices({
    required Function(int) onPressed,
    required Set<int> selectedIndices,
  }) async {
    final response = await http.get(Uri.parse('${baseUrl}users?page=2'));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List<dynamic> data = jsonBody['data'];

      return data.asMap().entries.map((entry) {
        int index = entry.key;
        var item = entry.value;

        return ItemModel.fromJson(
          json: item,
          itemSelected: selectedIndices.contains(index),
          onPressed: () => onPressed(index),
        );
      }).toList();
    } else {
      return [];
    }
  }
}
