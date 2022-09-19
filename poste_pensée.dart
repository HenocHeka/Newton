import 'dart:ffi';
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_social_app/constantes/zone_de_saisie.dart';
import 'package:our_social_app/ecrans/page_de_poste.dart';
import 'package:our_social_app/modeles/modele_utilisateur.dart';
import 'package:our_social_app/ressources/poste_uploarder.dart';
import 'package:provider/provider.dart';

import '../constantes/objet_constantes.dart';
import '../responsives/mobile_home_ercan.dart';
import '../ressources/recuperer-image.dart';
import '../ressources/utilisateur_provider.dart';

class Page_poste_pense extends StatefulWidget {
  const Page_poste_pense({Key? key}) : super(key: key);

  @override
  State<Page_poste_pense> createState() => _Page_poste_penseState();
}

class _Page_poste_penseState extends State<Page_poste_pense> {
 final TextEditingController _rendez_vous_description = TextEditingController();
  Uint8List? image_choisi;
  bool chargement = false;
  bool activecouleur= false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _rendez_vous_description.dispose();
  }

  void Aller_au_menu() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Mobile_home_ecran()));
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
                    image_choisi = image;
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
                    image_choisi = image;
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

  void Poster(
      String nom_utilisateur, String id_utilisateur, String photoProfil, String descriptionUtili) async {
    setState(() {
      chargement = true;
    });

    try {
      String requette = await UploaderPoste().PosterAvecPhoto(
          nom_utilisateur,
          id_utilisateur,
          descriptionUtili,
          _rendez_vous_description.text,
          photoProfil,
          image_choisi!);
      if (requette == 'success') {
        afficheur_snackBar(' Poste Publié !! ', context);
        setState(() {
          chargement = false;
        });
        Aller_au_menu();
      } else {
        afficheur_snackBar(requette, context);
        setState(() {
          chargement = false;
        });
      }
    } catch (err) {
      afficheur_snackBar(err.toString(), context);
      setState(() {
        chargement = false;
      });
    }
  }

  void Poster_Msg(
      String nom_utilisateur, String id_utilisateur, String photoProfil, String Utilidescription) async {
    setState(() {
      chargement = true;
    });

    try {
      String requette = await UploaderPoste().PosterSansPhoto(
        nom_utilisateur,
        id_utilisateur,
        Utilidescription,
        _rendez_vous_description.text,
        photoProfil,
      );
      if (requette == 'success') {
        afficheur(' Publié ! ', context);
        setState(() {
          chargement = false;
        });
        Aller_au_menu();
      } else {
        afficheur(requette, context);
        setState(() {
          chargement = false;
        });
      }
    } catch (err) {
      afficheur_snackBar(err.toString(), context);
      setState(() {
        chargement = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Utilisateur? utilisateur = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Créer une Publication',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: image_choisi == null ? false : true,
        actions: [
          image_choisi == null
              ? GestureDetector(
                  onTap: () async {
                    if(_rendez_vous_description.text.isEmpty){
                        afficheur('Champ Description Vide', context);
                    }else{
                         Poster_Msg(
                        '${utilisateur?.nom_utlisateur}',
                        '${utilisateur?.id_utlisateur}',
                        '${utilisateur?.photo_profil}',
                        '${utilisateur?.descriptio}');
                    }
                   
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: 15, right: 15),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(36, 151, 208, 255),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          chargement
                              ? Center(
                                  child: CupertinoActivityIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  'Publier',
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                )
                        ],
                      ),
                    ),
                  ))
              : Container()
        ],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Mobile_home_ecran())),
            icon: Icon(
              CupertinoIcons.arrow_left_circle,
              color: Colors.white,
            )),
      ),
      body: Container(
        child: Center(
          child: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: Stack(
                    children: [
                      image_choisi == null
                          ? Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height > 850
                                  ? 760
                                  : MediaQuery.of(context).size.height > 800
                                      ? 690
                                      : 600,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: IconButton(
                                    onPressed: Boite_choix_image,
                                    icon: Icon(
                                      CupertinoIcons.photo_on_rectangle,
                                      color: Colors.white38,
                                    )),
                              ),
                            )
                          : Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height > 850
                                  ? 720
                                  : MediaQuery.of(context).size.height > 800
                                      ? 650
                                      : 600,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                image: DecorationImage(
                                  image: MemoryImage(image_choisi!),
                                  fit: BoxFit.fill,
                                  alignment: FractionalOffset.topCenter,
                                ),
                              ),
                            ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        left: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                                setState(() {
                                  activecouleur = true;
                                });
                            },
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue ,
                                  width: 1,
                                ),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color.fromARGB(188, 37, 37, 37)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 19.0, left: 9),
                                        child: Container(
                                          width: 45,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              // border: Border.all(

                                              //     color: Colors.blue,
                                              //     width: 1.7)
                                                  ),
                                          child: Container(
                                          height: 45,
                                          width: 55,
                                          child: ClipOval(
                                            
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: '${utilisateur?.photo_profil}',
                                              placeholder: (context, url) => CupertinoActivityIndicator(color: Colors.white,),
                                             ),
                                          ),
                                        ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 17.0, left: 9),
                                        child: Container(
                                          width: 210,
                                          child: Zone_de_saisie_publication(
                                            readOnly: false,
                                              maxlines: 2,
                                              textInputType: TextInputType.text,
                                              textEditingController:
                                                  _rendez_vous_description,
                                              hintext: 'Faites une description '),
                                        ),
                                      ),
                                    ],
                                  ),
                                  image_choisi == null
                                      ? IconButton(
                                          onPressed: Boite_choix_image,
                                          icon: Icon(
                                            CupertinoIcons.add_circled_solid,
                                            color: Colors.white,
                                            size: 30,
                                          ))
                                      : IconButton(
                                          onPressed: () async {
                                            Poster(
                                                '${utilisateur?.nom_utlisateur}',
                                                '${utilisateur?.id_utlisateur}',
                                                '${utilisateur?.photo_profil}',
                                                 '${utilisateur?.descriptio}');
                                          },
                                          icon: chargement
                                              ? CupertinoActivityIndicator(
                                                  color: Colors.white,
                                                )
                                              : Icon(
                                                  Icons.send,
                                                  color: Colors.blue,
                                                  size: 30,
                                                ))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                chargement
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const LinearProgressIndicator(
                          backgroundColor: Colors.black,
                          color: Colors.blue,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
