import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  final _valueNotifier = ValueNotifier<int>(0);
  CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter with StreamBuilder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<int>(
              valueListenable: _valueNotifier,
              builder: (context, value, child) {
                return Text(
                  '$value',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _valueNotifier.value --;
                  },
                  child: const Text('Decrease'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    _valueNotifier.value ++;
                  },
                  child: const Text('Increase'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
