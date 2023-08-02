import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pfe/pages/homehotel/specialhotel.dart';
import 'package:pfe/pages/homevol/search.dart';
import '../../utils/utilsvol/styles.dart';


class  specialHotels extends StatefulWidget {
  static const String screenRoute = ' specialHotels';
  const  specialHotels ({Key? key}) : super(key: key);

  @override
  State< specialHotels> createState() => _specialHotelsState();
}

class _specialHotelsState extends State< specialHotels> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.blue,
        title: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white60,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_horiz,
              color: Colors.blue,
              size: 30,
            ),
          )
        ],
      ),
      backgroundColor: Styles.bgColor,
      body: ListView(
        children: [
          Container(
              padding:  EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Gap(60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Les offre spécial des Hotels ',
                            style: Styles.headline1Style,)
                        ],
                      ),
                    ],
                  ),
                  const Gap(25),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFF4F6FD),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            Search.screenRoute);
                      },
                      child: Row(
                        children: [
                          const Gap(5),
                          Text(
                            'Rechercher',
                            style: TextStyle(
                              color: Colors.grey.shade500,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                ],
              )
          ),

          Gap(15),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                ],
              )
          ),
          Gap(15),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Les Hotels",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
          SizedBox(height: 10),
          specialhotel(),
        ],
      ),
    );
  }

}
