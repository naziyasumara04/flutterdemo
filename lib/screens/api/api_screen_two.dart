import 'package:flutter/material.dart';

import '../../model/employee_model.dart';
import '../../services/employee_services.dart';

class ApiScreenTwo extends StatefulWidget {
  const ApiScreenTwo({super.key});

  @override
  State<ApiScreenTwo> createState() => _ApiScreenTwoState();
}

class _ApiScreenTwoState extends State<ApiScreenTwo> {
  late Future<List<EmployeeModel>> employeeData;

  @override
  void initState() {
    super.initState();
    employeeData = EmployeeServices().getEmployeeServices();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<EmployeeModel>>(
        future: employeeData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            // print("Error: ${snapshot.error}");
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No data available"));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final employee = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(employee.avatar ?? ''),
                  ),
                  trailing: Text("${employee.id}"),
                  title: Text(
                    "${employee.firstName ?? ''} ${employee.lastName ?? ''}",
                  ),
                  subtitle: Text(employee.email ?? ''),
                );
              },
            );
          }
        },
      ),
    );
  }
}
