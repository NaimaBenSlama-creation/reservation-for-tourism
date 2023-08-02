import 'package:flutter/material.dart';

class TouristPlaces extends StatelessWidget {
  const TouristPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              const Text("Hotel"),
              SizedBox(height: 10),
              Center(
                child: FloatingActionButton(
                  heroTag: 4,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.amber,
                  child: Icon(
                    Icons.hotel,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              const Text("Vol"),
              SizedBox(height: 10),
              Center(
                child: FloatingActionButton(
                  heroTag: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.airplanemode_on,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
              const Text("Vol"),
              SizedBox(height: 10),
              Center(
                child: FloatingActionButton(
                  heroTag: 5,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.blue,
                  child: Icon(
                    Icons.car_repair,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
