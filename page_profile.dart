import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/ecrans/page_connexion.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';
import 'package:our_social_app/ressources/authentification.dart';
import 'package:our_social_app/ressources/utilisateur_provider.dart';
import 'package:provider/provider.dart';

import '../modeles/modele_utilisateur.dart';

class Page_profile extends StatefulWidget {
  const Page_profile({Key? key}) : super(key: key);

  @override
  State<Page_profile> createState() => _Page_profileState();
}

class _Page_profileState extends State<Page_profile> {
  bool chargement = false;
  void se_deconnecter() async {
    await Authentification().Se_deconnecter();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => Page_connexion())));
  }

  @override
  Widget build(BuildContext context) {
    Utilisateur? utilisateur = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 26, 26, 26),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Votre Profil ',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        centerTitle: false,
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Stack(children: [
                  Container(
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications_active_outlined,
                          color: Colors.white,
                        )),
                  ),
                  Positioned(
                      top: 14,
                      left: 9,
                      child: Container(
                        height: 5,
                        width: 5,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ))
                ]),
                Container(
                  child: Container(
                    height: 44,
                    width: 46,
                    child: ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: '${utilisateur?.photo_profil}',
                        placeholder: (context, url) =>
                            CupertinoActivityIndicator(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Mobile_home_ecran())),
            icon: Icon(
              CupertinoIcons.arrow_left_circle,
              color: Colors.white,
            )),
        backgroundColor: Color.fromARGB(255, 26, 26, 26),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${utilisateur?.nom_utlisateur}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold),
                            ),
                            // Text('Wigglesworth',
                            //     style: TextStyle(
                            //         color: Colors.white,
                            //         fontSize: 27,
                            //         fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Container(
                                child: Row(
                                  children: [
                                    Text(
                                      '@${utilisateur?.descriptio}',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    Icon(
                                      Icons.check_circle,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('Modifier')),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('290k'),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text('Abonnés',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)))
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('40k'),
                            ),
                            Container(
                                decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 11, 113, 196),
                                    borderRadius: BorderRadius.circular(7)),
                                padding: EdgeInsets.all(8),
                                child: Text(
                                  'Rendez-vous',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Text('120k'),
                            ),
                            Container(
                                padding: EdgeInsets.all(10),
                                child: Text('Inscriptions',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  color: Color.fromARGB(255, 14, 14, 14),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          'MENU',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.white54),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoPopupSurface(
                                        child: Container(
                                          color: Colors.white,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 600,
                                          child: Center(),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        height: 65,
                                        child: Image.asset(
                                            'assets/Icons/schedule.png'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Rendez-vous',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoPopupSurface(
                                        child: Container(
                                          color: Colors.white,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 400,
                                          child: Center(),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        height: 70,
                                        child: Image.asset(
                                            'assets/Icons/presentation.png'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Cours',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CupertinoButton(
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoPopupSurface(
                                        child: Container(
                                          color: Colors.white,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 500,
                                          child: Center(),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 10),
                                        height: 64,
                                        child: Image.asset(
                                            'assets/Icons/social-chat.png'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Vos Salons',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            CupertinoButton(
                              onPressed: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (context) {
                                      return CupertinoPopupSurface(
                                        child: Container(
                                          color: Colors.white,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 600,
                                          child: Center(),
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                height: 110,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 8),
                                        height: 66,
                                        child: Image.asset(
                                            'assets/Icons/team.png'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Inscripts',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height > 800 ? 50 : 0,
                ),
                GestureDetector(
                  onTap: se_deconnecter,
                  child: Container(
                    height: 40,
                    width: 290,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 147, 23, 65),
                        ),
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 0),
                          child: Text(
                            'Déconnexion',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.white54),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
