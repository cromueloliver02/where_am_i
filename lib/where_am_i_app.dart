import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import 'helpers.dart';

class WhereAmIApp extends StatefulWidget {
  const WhereAmIApp({super.key});

  @override
  State<WhereAmIApp> createState() => _WhereAmIAppState();
}

class _WhereAmIAppState extends State<WhereAmIApp> {
  String? _cityOrTown;
  bool _loading = false;

  void _onGetCurrentCityLocation() async {
    try {
      setState(() => _loading = true);

      await Future.delayed(const Duration(milliseconds: 500));

      final Position position = await determinePosition();
      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final String cityOrTown =
          placemarks.first.locality ?? 'Unknown city/town';

      setState(() => _cityOrTown = cityOrTown);
    } catch (err) {
      debugPrint(err.toString());
    } finally {
      setState(() => _loading = false);
    }
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
              if (_cityOrTown != null) ...[
                Text(
                  'City/Town: $_cityOrTown',
                  style: const TextStyle(
                    fontSize: 25,
                  ),
                ),
                const SizedBox(height: 30),
              ],
              ElevatedButton.icon(
                icon: const Icon(Icons.place),
                label: const Text('Get City Location'),
                onPressed: _loading ? null : _onGetCurrentCityLocation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
