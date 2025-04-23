import 'package:flutter/material.dart';
import 'package:practice_project/provider/counter_provider.dart';
import 'package:practice_project/screens/api/api_practice_screen.dart';
import 'package:provider/provider.dart';

class ChallengeScreen extends StatefulWidget {
  const ChallengeScreen({super.key});

  @override
  State<ChallengeScreen> createState() => _ChallengeScreenState();
}

class _ChallengeScreenState extends State<ChallengeScreen> {

  @override
  Widget build(BuildContext context) {
    final counterValue = context.watch<CounterProvider>().value;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("challenge screen"),
              Text("here counter will be shown"),

              Text('$counterValue'),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ApiPracticeScreen()),
                  );
                },
                child: Text("apiscreen"),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'addButton',
            onPressed: context.read<CounterProvider>().increment,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: context.read<CounterProvider>().decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
