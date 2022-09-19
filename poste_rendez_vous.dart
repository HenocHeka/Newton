import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/constantes/zone_de_saisie.dart';
import 'package:our_social_app/ecrans/page_de_poste.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';
import 'package:our_social_app/ressources/rendez_vous_uploader.dart';
import 'package:our_social_app/ressources/reponse_acceptation.dart';
import 'package:provider/provider.dart';

import '../modeles/modele_utilisateur.dart';
import '../ressources/utilisateur_provider.dart';

class Poste_rendez_vous extends StatefulWidget {
  final snap;
  const Poste_rendez_vous({Key? key, required this.snap}) : super(key: key);

  @override
  State<Poste_rendez_vous> createState() => _Poste_rendez_vousState();
}

class _Poste_rendez_vousState extends State<Poste_rendez_vous> {
  final TextEditingController _rendez_vous_description =
      TextEditingController();
  final TextEditingController _rendez_vous_lieu = TextEditingController();
  final TextEditingController _rendez_vous_lieu_heure = TextEditingController();
  final TextEditingController heure_actuelle_debut = TextEditingController();
  final TextEditingController heure_actuelle_fin = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _rendez_vous_description.dispose();
    _rendez_vous_lieu.dispose();
    _rendez_vous_lieu_heure.dispose();
    heure_actuelle_debut.dispose();
    heure_actuelle_fin.dispose();
  }

  void effacerDemande() async {
    // await AcceptationDemande()
    //     .EffacerDemande(widget.snap['demandeId'].toString());
  }

  DateTime? date_actuell = DateTime.now();
  bool date_est_choisie = false;
  bool heure_est_choisie_debut = false;
  bool heure_est_choisie_fin = false;
  bool chargement = false;

  Future recuperer_date() async {
    try {
      DateTime? dateTime = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2030));

      DateTime? dateTime2 = date_actuell!.subtract(Duration(days: 1));

      if ((dateTime != null && dateTime.isAfter(dateTime2)) ||
          dateTime!.isAtSameMomentAs(date_actuell!)) {
        setState(() {
          date_actuell = dateTime;
          date_est_choisie = true;
        });
      } else {
        afficheur_snackBar(' La date du rendez-vous est invalide ', context);
      }
    } catch (e) {}
  }

  void ChangePage() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Mobile_home_ecran()));
  }

  Future Accepter(
    String nom_utilisateur,
    String photoProfile,
    String description,
    String id_demandeur,
  ) async {
    try {
      String requette = await AcceptationDemande().AccepterDemande(
          nom_utilisateur,
          photoProfile,
          description,
          id_demandeur,
          _rendez_vous_description.text,
          date_actuell,
          heure_actuelle_debut.text,
          heure_actuelle_fin.text,
          _rendez_vous_lieu_heure.text,
          _rendez_vous_lieu.text);
      if (requette == 'succes') {
        afficheur_snackBar('Rendez-vous confirmé', context);
      } else {
        afficheur_snackBar(requette, context);
      }
    } catch (err) {
      afficheur_snackBar(err.toString(), context);
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
        // leading: Container(
        //   width: 200,
        //   margin: EdgeInsets.all(2),
        //   child: IconButton(
        //       onPressed: () {
        //         Navigator.of(context).pushReplacement(MaterialPageRoute(
        //             builder: (context) => const Mobile_home_ecran()));
        //       },
        //       icon: Icon(
        //         Icons.cancel_sharp,
        //         color: Color.fromARGB(255, 189, 189, 189),
        //         size: 30,
        //       )),
        // ),
        actions: [
          GestureDetector(
              onTap: () async {
                if (_rendez_vous_description.text.isEmpty &&
                    _rendez_vous_lieu.text.isEmpty &&
                    _rendez_vous_lieu_heure.text.isEmpty &&
                    heure_actuelle_debut.text.isEmpty &&
                    heure_actuelle_fin.text.isEmpty) {
                  afficheur('Remplissez tous les champs', context);
                } else {
                await  Accepter(
                      '${utilisateur?.nom_utlisateur}',
                      '${utilisateur?.photo_profil}',
                      '${utilisateur?.descriptio}',
                      widget.snap['id_demandeur'].toString());
                  effacerDemande();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Mobile_home_ecran()));
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(36, 151, 208, 255),
                      borderRadius: BorderRadius.circular(16)),
                  child: Row(
                    children: [
                      Text(
                        'Envoyer',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ))
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
                    MediaQuery.of(context).size.height > 800
                        ? SizedBox(
                            height: 80,
                          )
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 58, 116, 162),
                                width: 1),
                            borderRadius: BorderRadius.circular(10),
                            color: champ_saisie_couleur),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      // border: Border.all(
                                      //     color: Colors.blue, width: 2)
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
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 245,
                                    height: 180,
                                    child: Zone_de_saisie_publication(
                                        readOnly: false,
                                        maxlines: 8,
                                        textInputType: TextInputType.text,
                                        textEditingController:
                                            _rendez_vous_description,
                                        hintext:
                                            'saisir consignes et exigences '),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: champ_saisie_couleur,
                          border: Border.all(
                              color: Color.fromARGB(255, 58, 116, 162),
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
                                      color: Color.fromARGB(255, 240, 240, 240),
                                      fontSize: 23,
                                    ),
                                  )
                                : Text(
                                    'Choisir la date de la réception ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(162, 255, 255, 255),
                                        fontSize: 16),
                                  ),
                            IconButton(
                                onPressed: recuperer_date,
                                icon: Icon(
                                  Icons.calendar_month_outlined,
                                  color: Color.fromARGB(255, 234, 234, 234),
                                  size: 30,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
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
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5),
                                      child: Text(
                                        'Heure de Réception',
                                        style: TextStyle(
                                            color: Colors.white60,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 17),
                                      ),
                                    ),
                                    Container(
                                      height: 45,
                                      width: 150,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: champ_saisie_couleur,
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 58, 116, 162),
                                            width: 1),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 45),
                                        child: Zone_de_saisie_publication(
                                            readOnly: false,
                                            textInputType: TextInputType.number,
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
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5),
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 172, 172, 172),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 17),
                                        ),
                                      ),
                                      Container(
                                        height: 45,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: champ_saisie_couleur,
                                          border: Border.all(
                                              color: Color.fromARGB(
                                                  255, 58, 116, 162),
                                              width: 1),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 43),
                                          child: Zone_de_saisie_publication(
                                              readOnly: false,
                                              textInputType: TextInputType.number,
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
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Lieu d\'entretien',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w300,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 2),
                      child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Color.fromARGB(255, 58, 116, 162),
                                width: 1),
                            borderRadius: BorderRadius.circular(10),
                            color: champ_saisie_couleur,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Zone_de_saisie_publication(
                                readOnly: false,
                                maxlines: 1,
                                textInputType: TextInputType.text,
                                textEditingController: _rendez_vous_lieu,
                                hintext:
                                    'Le lieu, ex : UPC/Croisement Triomphal'),
                          )),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Text(
                            'Temps d\'entretien',
                            style: TextStyle(
                                color: Colors.white60,
                                fontWeight: FontWeight.w300,
                                fontSize: 17),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Container(
                              height: 46,
                              width: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromARGB(255, 58, 116, 162),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10),
                                color: champ_saisie_couleur,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Zone_de_saisie_publication(
                                    readOnly: false,
                                    maxlines: 1,
                                    textInputType: TextInputType.text,
                                    textEditingController:
                                        _rendez_vous_lieu_heure,
                                    hintext: 'ex : 30 min ou 1 heure'),
                              )),
                        ),
                      ],
                    ),
                    MediaQuery.of(context).size.height > 800
                        ? Container(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 40, horizontal: 20),
                                    child: Container(
                                      padding: const EdgeInsets.all(1),
                                      width: 200,

                                      // child: Text(
                                      //   'Organisez vos rendez-vous sans divulguer votre numéro de téléphone ! Ainsi garder vos numéros avec vos proches.',
                                      //   style: TextStyle(
                                      //       color: Color.fromARGB(255, 142, 142, 142),
                                      //       fontSize: 14,
                                      //       fontWeight: FontWeight.w300,),textAlign:TextAlign.justify ,
                                      // ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container()
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
