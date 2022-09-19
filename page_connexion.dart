import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/ecrans/page_incription.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';
import 'package:our_social_app/responsives/responsive_layaut.dart';
import 'package:our_social_app/responsives/web_home_ecran.dart';
import 'package:our_social_app/ressources/authentification.dart';
import '../constantes/zone_de_saisie.dart';

class Page_connexion extends StatefulWidget {
  const Page_connexion({Key? key}) : super(key: key);

  @override
  State<Page_connexion> createState() => _Page_connexionState();
}

class _Page_connexionState extends State<Page_connexion> {
  final TextEditingController email = TextEditingController();
  final TextEditingController mot_de_passe = TextEditingController();
  bool chargement = false;
  bool Montrer_mot_de_passe = true;

  void dispose() {
    super.dispose();
    email.dispose();
    mot_de_passe.dispose();
  }

  void Se_connecter() async {
    setState(() {
      chargement = true;
    });

    String requette = await Authentification()
        .Authentifier(email: email.text, mot_de_passe: mot_de_passe.text);
    setState(() {
      chargement = false;
    });

    if (requette == 'success') {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Ecrans_responsive(
              resolution_mobile: Mobile_home_ecran(),
              resolution_web: Web_home_ecran())));
    } else {
      afficheur_snackBar(requette, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 2, 2),
      body: SafeArea(
          child: Center(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    width: double.infinity,
                    child: Center(
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'Connexion',
                              style: TextStyle(
                                color: Colors.pink,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: TextFieldInput(
                              textInputType: TextInputType.text,
                              hintext: 'Entrer votre email',
                              textEditingController: email,
                            ),
                          ),
                          SizedBox(
                            height: 24,
                          ),
                          Stack(children: [
                            TextFieldInput(
                              textInputType: TextInputType.text,
                              hintext: 'Entrer votre mot de passe',
                              textEditingController: mot_de_passe,
                              isPass: Montrer_mot_de_passe,
                            ),
                            Positioned(
                                right: 2,
                                bottom: 2,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (Montrer_mot_de_passe == true) {
                                          Montrer_mot_de_passe = false;
                                        } else {
                                          Montrer_mot_de_passe = true;
                                        }
                                      });
                                    },
                                    icon: Montrer_mot_de_passe
                                        ? Icon(
                                            Icons.visibility_off,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                          ))),
                          ]),
                          SizedBox(
                            height: 24,
                          ),
                          GestureDetector(
                            onTap: Se_connecter,
                            child: Container(
                              width: 330,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 185, 28, 80),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  chargement
                                      ? Center(
                                          child: CupertinoActivityIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          'Se connecter',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(' Pas de compte ?',
                                    style: TextStyle(fontSize: 13)),
                                GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) =>
                                                Page_Inscription())),
                                    child: Container(
                                        child: Text(
                                      ' Créez un nouveau ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
