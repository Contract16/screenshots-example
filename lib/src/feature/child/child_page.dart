import 'package:flutter/material.dart';

class ChildPage extends StatelessWidget {
  const ChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Child Page')),
      backgroundColor: Colors.blueAccent[100],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to the Child Page!',
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          Image.asset('assets/images/smiley.jpg', width: 100, height: 100),
        ],
      ),
    );
  }
}
