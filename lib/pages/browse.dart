
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/button.dart';
import '../styles/color.dart';
import '../styles/typo.dart';

class BrowseCars extends StatelessWidget {
  static const String screenRoute ='BrowseCars ';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: softwhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/cover.png',
                  ),
                ),
              ),
            ),
            Container(
              transform: Matrix4.translationValues(
                0.0,
                -24.0,
                0.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(
                          50,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: new InputDecoration.collapsed(
                                    hintText: 'Search for car name'),
                              ),
                            ),
                            Container(
                              width: 20,
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {},
                                icon: Image.asset(
                                  'assets/search.png',
                                  height: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      'Popular Cars',
                      style: header,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 24,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/mclaren.png',
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'McLaren Angga',
                                  style: product,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/mile.png',
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '38 miles',
                                      style: small,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/bmw.png',
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'BMW Mayuko',
                                  style: product,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/mile.png',
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '532 miles',
                                      style: small,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/miata.png',
                                  height: 90,
                                ),
                                SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Miata MX',
                                  style: product,
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/mile.png',
                                      height: 16,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                      '99 miles',
                                      style: small,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(
                        16,
                      ),
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'Get your dream car',
                                style: subheader,
                              ),
                              Text(
                                'First car should be easy',
                                style: small,
                              ),
                            ],
                          ),
                          Spacer(),
                          ElevatedButton(
                            style: buttonPrimary,
                            onPressed: () {},
                            child: Text(
                              'Get Loan',
                              style: labelPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'New Cars',
                          style: header,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 20,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/porsche.png',
                                height: 60,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Porsche GT3',
                                    style: product,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/mile.png',
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '99 miles',
                                        style: small,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '\$390,000',
                                style: subheader,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 20,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/ferrari.png',
                                height: 60,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Ferrari',
                                    style: product,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/mile.png',
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '99 miles',
                                        style: small,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '\$390,000',
                                style: subheader,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 10,
                            right: 20,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/mercedez.png',
                                height: 60,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'AMG Mercedes',
                                    style: product,
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                        'assets/mile.png',
                                        height: 16,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        '99 miles',
                                        style: small,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              Text(
                                '\$390,000',
                                style: subheader,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
