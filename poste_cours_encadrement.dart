import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:our_social_app/constantes/zone_de_saisie.dart';
import 'package:our_social_app/ecrans/page_de_poste.dart';
import 'package:our_social_app/ressources/cours_uploader.dart';
import 'package:our_social_app/ressources/creer_salon.dart';
import 'package:provider/provider.dart';

import '../constantes/objet_constantes.dart';
import '../modeles/modele_utilisateur.dart';
import '../responsives/mobile_home_ercan.dart';
import '../ressources/recuperer-image.dart';
import '../ressources/utilisateur_provider.dart';

class Post_cours_encadrement extends StatefulWidget {
  const Post_cours_encadrement({Key? key}) : super(key: key);

  @override
  State<Post_cours_encadrement> createState() => _Post_cours_encadrementState();
}

class _Post_cours_encadrementState extends State<Post_cours_encadrement> {
  final TextEditingController _rendez_vous_description =
      TextEditingController();
  final TextEditingController prix_controller = TextEditingController();
  final TextEditingController _lieu_du_cours = TextEditingController();
  final TextEditingController _nom_du_controlleur = TextEditingController();
  final TextEditingController heure_actuelle_debut = TextEditingController();
  final TextEditingController heure_actuelle_fin = TextEditingController();
  Uint8List? image_chosi;
  bool mode_payant_gratuit = false;
  bool mode_payant = true;
  bool chargement = false;
  String mode = 'Gratuit';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _rendez_vous_description.dispose();
    prix_controller.dispose();
    _nom_du_controlleur.dispose();
    _lieu_du_cours.dispose();
    heure_actuelle_debut.dispose();
    heure_actuelle_fin.dispose();
  }

  DateTime? date_actuell = DateTime.now();
  bool date_est_choisie = false;
  bool heure_est_choisie_debut = false;
  bool heure_est_choisie_fin = false;

  Future recuperer_date() async {
    try {
      DateTime? dateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2030));

      DateTime? dateTime2 = date_actuell!.subtract(Duration(days: 1));

      if ((dateTime != null && dateTime.isAfter(dateTime2)) ||
          dateTime!.isAtSameMomentAs(date_actuell!)) {
        setState(() {
          date_actuell = dateTime;
          date_est_choisie = true;
        });
      } else {
        afficheur_snackBar(' La date choisie est invalidée ', context);
      }
    } catch (e) {}
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
                    image_chosi = image;
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
                    image_chosi = image;
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

  void ChangePage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Mobile_home_ecran()));
  }

  void Creer_Salon(
    String nom_administrateur,
    String description_administrateur,
    String administrateurId,
    String photoProfileAdmin,
  ) async {
    try {
      String requette = await Creation_Salon().CreerSalon(nom_administrateur,
          description_administrateur, administrateurId, photoProfileAdmin);

      if (requette == 'success') {
      } else {
        afficheur_snackBar(requette, context);
      }
    } catch (err) {
      afficheur_snackBar(err.toString(), context);
    }
  }

  void PosterAvecImg(String nom_utilisateur, String id_utilisateur,
      String photoprofile, String UtilisateurDescription) async {
    setState(() {
      chargement = true;
    });
    try {
      String requette = await UploaderCours().PosterCoursGratuitAvecImage(
          nom_utilisateur: nom_utilisateur,
          id_utilisateur: id_utilisateur,
          photoProfile: photoprofile,
          descriptionUtilisateur: UtilisateurDescription,
          description: _rendez_vous_description.text,
          nom_du_cours: _nom_du_controlleur.text,
          lieuCours: _lieu_du_cours.text,
          photoPublier: image_chosi!,
          heureDeb: heure_actuelle_debut.text,
          heureFin: heure_actuelle_fin.text,
          montant: prix_controller.text,
          mode: mode,
          dateCours: date_actuell);

      if (requette == 'success') {
        afficheur('Publication Envoyée', context);
        setState(() {
          chargement = false;
        });
        ChangePage();
      } else {
        afficheur(requette, context);
        setState(() {
          chargement = false;
        });
      }
    } catch (err) {
      afficheur(err.toString(), context);
      setState(() {
        chargement = false;
      });
    }
  }

  void PosterSansImg(String nom_utilisateur, String id_utilisateur,
      String photoprofile, String UtilisateurDescription) async {
    setState(() {
      chargement = true;
    });
    try {
      String requette = await UploaderCours().PosterCoursGratuitSansImage(
          nom_utilisateur: nom_utilisateur,
          id_utilisateur: id_utilisateur,
          photoProfile: photoprofile,
          descriptionUtilisateur: UtilisateurDescription,
          description: _rendez_vous_description.text,
          nom_du_cours: _nom_du_controlleur.text,
          lieuCours: _lieu_du_cours.text,
          heureDeb: heure_actuelle_debut.text,
          heureFin: heure_actuelle_fin.text,
          montant: prix_controller.text,
          mode: mode,
          dateCours: date_actuell);

      if (requette == 'success') {
        afficheur('Publication Envoyée', context);
        setState(() {
          chargement = false;
        });
        ChangePage();
      } else {
        afficheur(requette, context);
        setState(() {
          chargement = false;
        });
      }
    } catch (err) {
      afficheur(err.toString(), context);
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
        centerTitle: false,
        actions: [
          GestureDetector(
              onTap: () async {
                if (_rendez_vous_description.text.isEmpty &&
                    prix_controller.text.isEmpty &&
                    _lieu_du_cours.text.isEmpty &&
                    _nom_du_controlleur.text.isEmpty &&
                    heure_actuelle_debut.text.isEmpty &&
                    heure_actuelle_fin.text.isEmpty) {
                  afficheur('Remplissez tous les champs ', context);
                } else {
                  if (image_chosi != null) {
                    await showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Attention'),
                            content: Text(
                                'En publiant cet événement, un salon de discussion sera automatique crée. Sinon cet évémenent n\'en aura plus, Créer ?'),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () async {
                                  Creer_Salon(
                                      '${utilisateur?.nom_utlisateur}',
                                      '${utilisateur?.descriptio}',
                                      '${utilisateur?.id_utlisateur}',
                                      '${utilisateur?.photo_profil}');
                                  PosterAvecImg(
                                      '${utilisateur?.nom_utlisateur}',
                                      '${utilisateur?.id_utlisateur}',
                                      '${utilisateur?.photo_profil}',
                                      '${utilisateur?.descriptio}');

                                  Navigator.of(context).pop();
                                   ChangePage();
                                },
                                child: Text('Oui'),
                                isDestructiveAction: false,
                              ),
                              CupertinoDialogAction(
                                onPressed: () async {
                                  PosterAvecImg(
                                      '${utilisateur?.nom_utlisateur}',
                                      '${utilisateur?.id_utlisateur}',
                                      '${utilisateur?.photo_profil}',
                                      '${utilisateur?.descriptio}');
                                  Navigator.of(context).pop();
                                  ChangePage();
                                },
                                child: Text('Non'),
                                isDestructiveAction: true,
                              ),
                            ],
                          );
                        });
                  } else if (image_chosi == null) {
                    await showCupertinoDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Attention'),
                            content: Text(
                                'En publiant cet événement, un salon de discussion sera automatique crée. Sinon cet évémenent n\'en aura plus, Créer ?'),
                            actions: [
                              CupertinoDialogAction(
                                onPressed: () async {
                                  Creer_Salon(
                                      '${utilisateur?.nom_utlisateur}',
                                      '${utilisateur?.descriptio}',
                                      '${utilisateur?.id_utlisateur}',
                                      '${utilisateur?.photo_profil}');
                                  PosterSansImg(
                                      '${utilisateur?.nom_utlisateur}',
                                      '${utilisateur?.id_utlisateur}',
                                      '${utilisateur?.photo_profil}',
                                      '${utilisateur?.descriptio}');
                                  Navigator.of(context).pop();
                                   ChangePage();
                                },
                                child: Text('Oui'),
                                isDestructiveAction: false,
                              ),
                              CupertinoDialogAction(
                                onPressed: () async {
                                  PosterSansImg(
                                      '${utilisateur?.nom_utlisateur}',
                                      '${utilisateur?.id_utlisateur}',
                                      '${utilisateur?.photo_profil}',
                                      '${utilisateur?.descriptio}');
                                  Navigator.of(context).pop();
                                   ChangePage();
                                },
                                child: Text('Non'),
                                isDestructiveAction: true,
                              ),
                            ],
                          );
                        });
                  } else {}
                }
              },
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 15, right: 10),
                    decoration: BoxDecoration(
                        color: mode_payant_gratuit
                            ? Color.fromARGB(104, 47, 84, 48)
                            : Color.fromARGB(36, 151, 208, 255),
                        borderRadius: BorderRadius.circular(12)),
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
                                    color: mode_payant_gratuit
                                        ? Colors.green
                                        : Color.fromARGB(255, 59, 167, 255),
                                    fontWeight: FontWeight.bold),
                              )
                      ],
                    ),
                  )))
        ],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => Mobile_home_ecran())),
            icon: Icon(
              CupertinoIcons.arrow_left_circle,
              color: Colors.white,
            )),
      ),
      body: Center(
        child: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 0, 0, 0)),
                        height: image_chosi == null ? 150 : 245,
                        child: image_chosi == null
                            ? Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          CupertinoIcons.photo_on_rectangle,
                                          color: Color.fromARGB(
                                              255, 189, 189, 189),
                                          size: 30,
                                        ),
                                      ),
                                      Text(
                                        'Photo / Image',
                                        style: TextStyle(
                                            color: Color.fromARGB(
                                                162, 255, 255, 255)),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: MemoryImage(image_chosi!),
                                            fit: BoxFit.fill,
                                            alignment:
                                                FractionalOffset.center)),
                                  ),
                                  Positioned(
                                      right: 1,
                                      bottom: 1,
                                      child: IconButton(
                                          onPressed: Boite_choix_image,
                                          icon: Icon(
                                            CupertinoIcons.add_circled_solid,
                                            color: Colors.white,
                                            size: 30,
                                          )))
                                ],
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Container(
                        padding: EdgeInsets.only(left: 27, top: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: mode_payant_gratuit
                                  ? Colors.green
                                  : Color.fromARGB(255, 58, 116, 162),
                              width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 43, 43, 43),
                        ),
                        height: 45,
                        child: Zone_de_saisie_publication(
                            readOnly: false,
                            maxlines: 1,
                            textInputType: TextInputType.text,
                            textEditingController: _nom_du_controlleur,
                            hintext: 'Indiquer le nom du cours ou le thème  '),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 2),
                      child: Container(
                        padding: EdgeInsets.only(left: 27, top: 5),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: mode_payant_gratuit
                                  ? Colors.green
                                  : Color.fromARGB(255, 58, 116, 162),
                              width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 43, 43, 43),
                        ),
                        height: 43,
                        child: Zone_de_saisie_publication(
                            readOnly: false,
                            maxlines: 1,
                            textInputType: TextInputType.text,
                            textEditingController: _lieu_du_cours,
                            hintext:
                                'Indiquer le lieu où sera donné le cours  '),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 2),
                      child: Container(
                        height: 43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 43, 43, 43),
                          border: Border.all(
                              color: mode_payant_gratuit
                                  ? Colors.green
                                  : Color.fromARGB(255, 58, 116, 162),
                              width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            date_est_choisie
                                ? Text(
                                    '${date_actuell!.day} / ' +
                                        '${date_actuell!.month} / ' +
                                        '${date_actuell!.year}',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 18),
                                  )
                                : Text(
                                    'Choisir la date du cours ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(162, 255, 255, 255),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w300),
                                  ),
                            IconButton(
                                onPressed: recuperer_date,
                                icon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Color.fromARGB(255, 245, 251, 255),
                                  size: 26,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Container(
                        child: Row(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 5, left: 5, bottom: 5),
                                      child: Text(
                                        'Heure de Cours',
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                      height: 40,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromARGB(255, 43, 43, 43),
                                        border: Border.all(
                                            color: mode_payant_gratuit
                                                ? Colors.green
                                                : Color.fromARGB(
                                                    255, 58, 116, 162),
                                            width: 1),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 43),
                                        child: Zone_de_saisie_publication(
                                            readOnly: false,
                                            textInputType: TextInputType.text,
                                            textEditingController:
                                                heure_actuelle_debut,
                                            hintext: '00h00',
                                            maxlines: 1),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 17,
                            ),
                            Row(
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5, bottom: 5),
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Container(
                                        height: 40,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              Color.fromARGB(255, 43, 43, 43),
                                          border: Border.all(
                                              color: mode_payant_gratuit
                                                  ? Colors.green
                                                  : Color.fromARGB(
                                                      255, 58, 116, 162),
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 43),
                                          child: Zone_de_saisie_publication(
                                              readOnly: false,
                                              textInputType: TextInputType.text,
                                              textEditingController:
                                                  heure_actuelle_fin,
                                              hintext: '02h00',
                                              maxlines: 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 5),
                          child: Text(
                            'Montant de la Participation',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w300,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Container(
                              height: 45,
                              width: 180,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: mode_payant_gratuit
                                        ? Colors.green
                                        : Color.fromARGB(255, 58, 116, 162),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(255, 43, 43, 43),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: mode_payant_gratuit
                                      ? Zone_de_saisie_publication(
                                          readOnly: false,
                                          maxlines: 1,
                                          textInputType: TextInputType.text,
                                          textEditingController:
                                              prix_controller,
                                          hintext: 'Montant en francs')
                                      : Zone_de_saisie_publication(
                                          readOnly: true,
                                          maxlines: 1,
                                          textInputType: TextInputType.text,
                                          textEditingController:
                                              prix_controller,
                                          hintext: 'Montant en francs'))),
                        ),
                        SizedBox(
                          width:
                              MediaQuery.of(context).size.width > 400 ? 20 : 0,
                        ),
                        GestureDetector(
                            onTap: () {},
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 10, bottom: 10, left: 15, right: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Gratuit ',
                                            style: TextStyle(
                                                color: mode_payant_gratuit
                                                    ? Colors.white60
                                                    : Color.fromARGB(
                                                        255, 255, 255, 255),
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '/',
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(' Payant ',
                                              style: TextStyle(
                                                  color: mode_payant_gratuit
                                                      ? Color.fromARGB(
                                                          196, 49, 255, 125)
                                                      : Colors.white60,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12)),
                                        ],
                                      )
                                    ],
                                  ),
                                )))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CupertinoSwitch(
                              value: mode_payant_gratuit,
                              onChanged: (bool x) {
                                x = true;
                                setState(() {
                                  mode = 'Payant';
                                  if (mode_payant_gratuit == false) {
                                    mode_payant_gratuit = x;
                                  } else {
                                    mode_payant_gratuit = false;
                                  }
                                });
                              })
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 80,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: mode_payant_gratuit
                                  ? Colors.green
                                  : Color.fromARGB(255, 58, 116, 162),
                              width: 1),
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 43, 43, 43),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 19.0, left: 9),
                                  child: Container(
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // border: Border.all(
                                      // color: Colors.blue, width: 1.7)),
                                    ),
                                    child:  Container(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 17.0, left: 9, right: 10),
                                      child: Container(
                                        width: 240,
                                        child: Zone_de_saisie_publication(
                                            readOnly: false,
                                            maxlines: 2,
                                            textInputType: TextInputType.text,
                                            textEditingController:
                                                _rendez_vous_description,
                                            hintext:
                                                'laisser une description '),
                                      ),
                                    ),
                                    Positioned(
                                      right: -15,
                                      bottom: 15,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: IconButton(
                                            onPressed: Boite_choix_image,
                                            icon: Icon(
                                              Icons.add_a_photo_outlined,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              size: 20,
                                            )),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    MediaQuery.of(context).size.height > 800
                        ? Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 4),
                                    child: Container(
                                      padding: const EdgeInsets.all(1),
                                      width: 200,

                                      // child: Text(
                                      //   'Ubwakeme vous aide à vendre vos services d\'enseignement en tant qu\'enseigant d\'université ou professionnel, et instructeur.',
                                      //   style: TextStyle(
                                      //       color: Color.fromARGB(255, 144, 144, 144),
                                      //       fontSize: 14,
                                      //       fontWeight: FontWeight.w300,),textAlign:TextAlign.justify ,
                                      // ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
