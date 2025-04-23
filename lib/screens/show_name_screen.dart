import 'package:flutter/material.dart';
import 'package:practice_project/screens/challenge_screen.dart';
import 'package:provider/provider.dart';

import '../provider/counter_provider.dart';
import '../provider/user_provider.dart';

class ShowNameScreen extends StatefulWidget {
  const ShowNameScreen({super.key});

  @override
  State<ShowNameScreen> createState() => _ShowNameScreenState();
}

class _ShowNameScreenState extends State<ShowNameScreen> {
  @override
  Widget build(BuildContext context) {
    final counterValue = context.watch<CounterProvider>().value;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("name is showing"),
          Text('$counterValue'),
          Text(context.watch<UserProvider>().name),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ChallengeScreen()),
              );
            },
            child: Text("move"),
          ),
        ],
      ),
    );
  }
}
