import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MapsScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  MapsScreen({required this.latitude, required this.longitude});

  void openMaps() async {
    String googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not open the map.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Ouvrir Maps'),
          onPressed: openMaps,
        ),
      ),
    );
  }
}

