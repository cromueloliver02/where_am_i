import 'package:flutter/material.dart';

class WhereAmIApp extends StatelessWidget {
  const WhereAmIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where Am I',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Where Am I?'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                icon: const Icon(Icons.place),
                label: const Text('Get City Location'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
