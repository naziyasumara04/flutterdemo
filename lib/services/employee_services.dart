import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/employee_model.dart';

class EmployeeServices {
  var baseUrl = "https://reqres.in/api/";

  Future<List<EmployeeModel>> getEmployeeServices() async {
    var response = await http.get(Uri.parse('$baseUrl + "users?page=1"'));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List<dynamic> data = jsonBody['data'];
      // print(data);
      return data.map((item) => EmployeeModel.fromJson(item)).toList();
    } else {
      // print('Failed to load employee: ${response.statusCode}');
      return [];
    }
  }
}
