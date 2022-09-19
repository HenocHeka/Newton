import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/ecrans/page_connexion.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';
import 'package:our_social_app/responsives/responsive_layaut.dart';
import 'package:our_social_app/responsives/web_home_ecran.dart';
import 'package:our_social_app/ressources/inscription_methode.dart';

import '../constantes/zone_de_saisie.dart';
import '../ressources/recuperer-image.dart';

class Page_Inscription extends StatefulWidget {
  const Page_Inscription({Key? key}) : super(key: key);

  @override
  State<Page_Inscription> createState() => _Page_InscriptionState();
}

class _Page_InscriptionState extends State<Page_Inscription> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController description = TextEditingController();
  bool Montre_mot_de_passe = true;
  Uint8List? nouvelle_image_choisie;
  Uint8List? profile_par_defaut;
  bool chargement = false;

  List<Widget> les_zones_de_saisie = [];

  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
    name.dispose();
    description.dispose();
  }

  Future Boite_choix_image() async {
    await showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              'Choisir l\'image  ',
              style: TextStyle(fontSize: 20),
            ),
            children: [
              SimpleDialogOption(
                child: Text('Photo Camera'),
                padding: EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();

                  Uint8List image =
                      await Recuperateur_Image(ImageSource.camera);
                  setState(() {
                    nouvelle_image_choisie = image;
                  });
                },
              ),
              SimpleDialogOption(
                child: Text('Photo Gallerie'),
                padding: EdgeInsets.all(20),
                onPressed: () async {
                  Navigator.of(context).pop();

                  Uint8List image =
                      await Recuperateur_Image(ImageSource.gallery);
                  setState(() {
                    nouvelle_image_choisie = image;
                  });
                },
              ),
              SimpleDialogOption(
                child: Text('Annuler'),
                padding: EdgeInsets.all(20),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  void Inscrire() async {
    setState(() {
      chargement = true;
    });
    String requete = await Inscription().Inscrire(name.text, description.text,
        email.text, password.text, nouvelle_image_choisie!);
         setState(() {
     chargement = false;
   });
   if(requete == 'success'){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Ecrans_responsive(
        resolution_mobile: Mobile_home_ecran() , 
        resolution_web: Web_home_ecran()
        )));
   }else{
      afficheur_snackBar(requete, context);
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
                          Stack(
                            children: [
                              //  ICI A L'AIDE D'UN TERNAIRE NOUS VERIFIONS SI L'IMAGE CHOISIE OU PAS,
                              // SI OUI ON MODIFIE SINON L'IMAGE PAR DEFAUT EST RECUPERE DE DEPUIS L'APP

                              // ignore: unrelated_type_equality_checks
                              nouvelle_image_choisie != null
                                  ? CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          MemoryImage(nouvelle_image_choisie!),
                                    )
                                  : CircleAvatar(
                                      radius: 70,
                                      backgroundImage: const AssetImage(
                                          'assets/logo/profile.jpg'),
                                    ),
                              Positioned(
                                  bottom: -10,
                                  right: -5,
                                  child: IconButton(
                                    onPressed: Boite_choix_image,
                                    icon: Icon(Icons.add_a_photo),
                                  ))
                            ],
                          ),

                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            child: TextFieldInput(
                              textInputType: TextInputType.text,
                              hintext: 'Entrer votre prénom',
                              textEditingController: name,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFieldInput(
                              textInputType: TextInputType.text,
                              hintext: 'Entrer ce que vous faites',
                              textEditingController: description,
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: TextFieldInput(
                              textInputType: TextInputType.text,
                              hintext: 'Entrer votre email',
                              textEditingController: email,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          // the field text for password
                          Stack(children: [
                            TextFieldInput(
                              textInputType: TextInputType.text,
                              hintext: 'Entrer votre mot de passe',
                              textEditingController: password,
                              isPass: Montre_mot_de_passe,
                            ),
                            Positioned(
                                right: 2,
                                bottom: 2,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (Montre_mot_de_passe == true) {
                                          Montre_mot_de_passe = false;
                                        } else {
                                          Montre_mot_de_passe = true;
                                        }
                                      });
                                    },
                                    icon: Montre_mot_de_passe
                                        ? Icon(
                                            Icons.visibility_off,
                                          )
                                        : Icon(
                                            Icons.visibility,
                                          ))),
                          ]),
                          SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: Inscrire,
                            child: Container(
                              width: 330,
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 185, 28, 80),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // ICI A L'AIDE DE TERNAIRE NOUS VERIFIONS SI LE BOUTON EST CLIQUE,
                                  // SI OUI LE CHARGEMENT EST LANCE ET SINON LE TEXTE DEMANDE DE S'INSCRIRE
                                  chargement
                                      ? Center(
                                          child: CupertinoActivityIndicator(
                                            color: Colors.white,
                                          ),
                                        )
                                      : Text(
                                          'S\'inscrire ',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Vous avez un compte ?',
                                  style: TextStyle(fontSize: 13),
                                ),
                                GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushReplacement(MaterialPageRoute(
                                            builder: (context) =>
                                                Page_connexion())),
                                    child: Container(
                                        child: Text(
                                      ' Connectez-vous ',
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
            ),
          ],
        ),
      )),
    );
  }
}
