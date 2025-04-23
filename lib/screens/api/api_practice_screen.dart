import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'api_screen_two.dart';

class ApiPracticeScreen extends StatefulWidget {
  const ApiPracticeScreen({super.key});

  @override
  State<ApiPracticeScreen> createState() => _ApiPracticeScreenState();
}

class _ApiPracticeScreenState extends State<ApiPracticeScreen> {
  String dataVal = "fetching data";
  List<dynamic> users = [];
  bool showNameEmail = false;
  bool showUsernamePassword = false;
  bool showDateAge = false;

  void fetchData() async {
    final response = await http.get(
      Uri.parse('https://randomuser.me/api/?results=5'),
    );

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      setState(() {
        users = json['results'];
        showNameEmail = true;
        showUsernamePassword = true;
        showDateAge = true;
        dataVal = "data fetched";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          // padding: const EdgeInsets.all(8.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApiScreenTwo()),
                  );
                },
                icon: Icon(Icons.add),
              ),
              Text(dataVal),
              _button("name and email", () {
                fetchData();
              }),
              SizedBox(height: 40.h),
              _button("username and password", () {
                fetchData();
              }),
              _button("daet and age", () {
                fetchData();
              }),
              showNameEmail ? _showNameAndEmailContainer() : SizedBox(),
              showUsernamePassword ? _showNameAndPassword() : SizedBox(),
              showDateAge ? _showDateAge() : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _showNameAndEmailContainer() {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              // final user=users['name']["first"];
              final email = user["email"];
              final name = user["name"]["first"];
              return Column(children: [Text('$name'), Text('$email')]);
            },
          ),
        ),
      ],
    );
  }

  Widget _showNameAndPassword() {
    return Column(
      children: [
        // Text("Usernames and password"),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final loginName = user['login']['username'];
              final loginPassword = user['login']['password'];
              return ListTile(
                title: Text('$loginName'),
                subtitle: Text('$loginPassword'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _showDateAge() {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, int index) {
              final user = users[index];
              final date = user['dob']['date'];
              final age = user['dob']['age'];
              final image = user['picture']['thumbnail'];
              return ListTile(
                leading: Image.network(image),
                title: Text('$date'),
                subtitle: Text('$age'),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _button(String btn, VoidCallback onTap) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      child: GestureDetector(onTap: onTap, child: Text(btn)),
    );
  }
}
