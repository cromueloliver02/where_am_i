import 'package:flutter/material.dart';

class WhereAmIApp extends StatelessWidget {
  const WhereAmIApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Where Am I',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text('WHERE AM I APP'),
        ),
      ),
    );
  }
}
