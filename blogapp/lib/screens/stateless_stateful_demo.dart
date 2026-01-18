import 'package:flutter/material.dart';

/// ---------- Stateless Widget ----------
class DemoHeader extends StatelessWidget {
  const DemoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Welcome to Hot Reload!',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

/// ---------- Stateful Widget ----------
class CounterSection extends StatefulWidget {
  const CounterSection({super.key});

  @override
  State<CounterSection> createState() => _CounterSectionState();
}

class _CounterSectionState extends State<CounterSection> {
  int count = 0;

  // void incrementCounter() {
  //   setState(() {
  //     count++;
  //   });
  // }
  void incrementCounter() {
    setState(() {
      count++;
      debugPrint('Count updated to $count');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: $count', style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: incrementCounter,
          child: const Text('Increase'),
        ),
      ],
    );
  }
}

/// ---------- Main Screen ----------
class StatelessStatefulDemo extends StatelessWidget {
  const StatelessStatefulDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stateless vs Stateful')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            DemoHeader(), // Stateless
            SizedBox(height: 30),
            CounterSection(), // Stateful
          ],
        ),
      ),
    );
  }
}
