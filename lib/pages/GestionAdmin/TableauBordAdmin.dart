import 'package:flutter/material.dart';
import 'ClientPage.dart';
import 'PartenairesPage.dart';
import 'Systemepyramidal.dart';
import 'ajouterclientfidele.dart';
import 'package:pfe/pages/GestionAdmin/Evaluation.dart';

 class AdminDashboardPage extends StatelessWidget {
  const AdminDashboardPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ClientListScreen()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            child: Image.asset(
                              'assets/images/cclient.png',
                              width: 100, // Réduire la largeur de l'image
                            ),
                          ),
                          const Text('Gérer les clients'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>   AjouterClientFidel()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            child: Image.asset(
                              'assets/icons/aff.png',
                              width: 70, // Réduire la largeur de l'image
                            ),
                          ),
                          const Text('Ajouter Client Fidél'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  const partenaireListScreen()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            child: Image.asset(
                              'assets/images/commerciaux.jpg',
                              width: 70, // Réduire la largeur de l'image
                            ),
                          ),
                          const Text('Gérer partenaires commerciaux'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Evaluation()),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            child: Image.asset(
                              'assets/images/dev.png',
                              width: 70, // Réduire la largeur de l'image
                            ),
                          ),
                          const Text('Evolution'),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => stystemmefidelite ()),



                        );

                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 16.0),
                            child: Image.asset(
                              'assets/images/sys.png',
                              width: 100, // Réduire la largeur de l'image
                            ),
                          ),
                          const Text('Système Pyramidal'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
 }
