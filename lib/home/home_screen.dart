import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:pfe/constants/textstyle_ext.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pfe/constants/dimension_constants.dart';
import 'package:pfe/pages/GestionClient/profileClient.dart';
import '../pages/homevol/volcard.dart';
import '../pages/homehotel/homehotel.dart';
import '../pages/homehotel/recommended_place.dart';
import '../pages/home cars/homecars.dart';
import '../pages/homevol/homeVol.dart';
import 'package:pfe/pages/homehotel/specialhotel.dart';
import 'maps.dart';

class HomeScreen extends StatefulWidget {
  static const String screenRoute ='HomeScreen';


  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Fochka Travel"),
            Text(
              "Voyage plus Ganger PLus !",
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Ionicons.person), onPressed: () {  Navigator.of(context).pushNamed(ProfilClient.screenRoute);},
          ),
          Padding(
            padding: EdgeInsets.only(left: 8.0, right: 12),
            child:IconButton(
              icon: Icon(Ionicons.notifications_outline), onPressed: () {  },
            ),
          ),
        ],
      ),

     body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kItemPadding),
    child: SingleChildScrollView(
    child: Column(
    children: [
     const Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
    SizedBox(
    width: kMinPadding,
    ),
    ],
    ),
     const SizedBox(
    height: kDefaultPadding,
    ),
    TextField(
    enabled: true,
    autocorrect: false,
    decoration: const InputDecoration(
    hintText: 'Recherchez votre destination',
    prefixIcon: Padding(
    padding: EdgeInsets.all(8.0),
    child: Icon(
    FontAwesomeIcons.magnifyingGlass,
    color: Colors.black
      ,
      size: 14,
    ),
    ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(
          Radius.circular(
            kItemPadding,
          ),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
    ),
      style: TextStyles.defaultStyle,
      onChanged: (value) {},
      onSubmitted: (String submitValue) {},
    ),
      const SizedBox(
        height: kDefaultPadding,
      ),
      Row(
        children: [
          const SizedBox(height: 20),
          const Spacer(),
          Center(
            child: FloatingActionButton(
              heroTag: const EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.amber,
              child: const Icon(
                Icons.hotel,
                color: Colors.white,
              ),
              onPressed: () {  Navigator.of(context).pushNamed(  Hotels.screenRoute);
              },
            ),
          ),
          Spacer(),
          const SizedBox(height: 10),
          Center(
            child: FloatingActionButton(
              heroTag: const EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.airplanemode_on,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed( Homevol.screenRoute);
              },
            ),
          ),
          Spacer(),
          SizedBox(height: 10),
          Center(
            child: FloatingActionButton(
              heroTag: EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.pinkAccent,
              child: const Icon(
                Icons.car_repair,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(Homecars.screenRoute);
              },
            ),
          ),
          Spacer(),
          SizedBox(height: 10),
          Center(
            child: FloatingActionButton(
              heroTag: EdgeInsets.symmetric(horizontal: 50),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: Colors.purpleAccent,
              child: const Icon(
                Icons.map_outlined,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MapsScreen(latitude: 37.422, longitude: -122.084),
                  ),
                );

              },
            ),
          ),
          const Spacer(),
        ],
      ),
      const SizedBox(
        height: kMediumPadding,
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Meilleur Hotels",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
       SizedBox(height: 10),
       RecommendedPlaces(),
      SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            " Trouve Meilleur Destination ",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      SizedBox(height: 5),
      cardvol(),

    ],
    ),
      ),
    ));
  }
}

