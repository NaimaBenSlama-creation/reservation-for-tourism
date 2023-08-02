import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pfe/pages/homevol/search.dart';
import '../../utils/utilsvol/styles.dart';
import 'offrespecialvol.dart';
import 'volcard.dart';

class Homevol extends StatefulWidget {
  static const String screenRoute = 'Homevol';
  const Homevol({Key? key}) : super(key: key);

  @override
  State<Homevol> createState() => _HomevolState();
}

class _HomevolState extends State<Homevol> {

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
                          Text('Voyage plus Ganger plus ',
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
                            'Rechercher votre destination',
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

                  const Gap(40),
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
                  Text('Les Voyage ', style: Styles.headline2Style,),

                ],
              )
          ),
          Gap(15),
           SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.only(left: 20),
            scrollDirection: Axis.horizontal,

          ),
          SizedBox(height: 10),
          specialvol()

        ],
      ),
    );
  }

}
