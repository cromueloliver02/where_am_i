import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'helpers.dart';

class WhereAmIApp extends StatelessWidget {
  const WhereAmIApp({super.key});

  void _onGetCurrentCityLocation() async {
    final Position position = await determinePosition();
    print('position $position');
  }

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
                onPressed: _onGetCurrentCityLocation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
