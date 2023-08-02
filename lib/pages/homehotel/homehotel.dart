import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pfe/pages/homehotel/recommended_place.dart';
import 'package:pfe/pages/homehotel/specialhotel.dart';
import 'package:pfe/pages/homevol/search.dart';
import '../../utils/utilsvol/styles.dart';
import 'hotels.dart';


class  Hotels extends StatefulWidget {
  static const String screenRoute = ' Hotels';
  const  Hotels ({Key? key}) : super(key: key);

  @override
  State< Hotels> createState() => _HotelsState();
}

class _HotelsState extends State< Hotels> {

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
                          Text('Les Offres d\'Hotels ',
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
                            'Rechercher la Meilleur Hotel',
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

                   Gap(40),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Les Hotels ',
                        style: Styles.headline2Style,),

                    ],
                  ),
                ],
              )
          ),

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

          hotelspage(),
          SizedBox(height: 5),

        ],
      ),
      );
  }

}
