import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/ecrans/poste_rendez_vous.dart';
import 'package:our_social_app/modeles/cours.dart';
import 'package:our_social_app/ressources/demande_rendez_vous.dart';
import 'package:our_social_app/ressources/reponse_acceptation.dart';
import 'package:provider/provider.dart';

import '../modeles/modele_utilisateur.dart';
import '../ressources/utilisateur_provider.dart';

class RendeVousCarte extends StatefulWidget {
  final snap;
  const RendeVousCarte({Key? key, required this.snap}) : super(key: key);

  @override
  State<RendeVousCarte> createState() => _RendeVousCarteState();
}

class _RendeVousCarteState extends State<RendeVousCarte> {
  bool checkBouton = false;
  bool comfirme_rdv = false;
  bool supprimer = false;

  void effacerDemande() async {
    // await AcceptationDemande()
    //     .EffacerDemande(widget.snap['demandeId'].toString());
  }

   Refuser(
    String nom_utilisateur,
    String photoProfile,
    String description,
    String id_destinateur,
  ) async {
    try {
      String requette = await AcceptationDemande().RefuserDemande(
          nom_utilisateur, photoProfile, description, id_destinateur);
      if (requette == 'success') {
        afficheur_snackBar('Demande Suppromiée', context);
      } else {
        afficheur_snackBar(requette, context);
      }
    } catch (err) {
      afficheur_snackBar(err.toString(), context);
    }
  } 

  ConfirmerRdv()async{
    try{
      await DemandeRendezV().ConfirmerRdv(widget.snap['demandeId'], true);
    }catch(err){
      afficheur_snackBar(err.toString(), context);
    }
  }
  RefuserRdv()async{
    try{
          await DemandeRendezV().ResufRdv(widget.snap['demandeId'], true);
    }catch(err){
      afficheur_snackBar(err.toString(), context);
    }
  }

  Future EffacerPub() async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Attention'),
            content:
                Text('La demande sera definitivement supprimée, Supprimer ?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () async {
                  setState(() {
                    supprimer = true;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Oui'),
                isDestructiveAction: false,
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Non'),
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Utilisateur? utilisateur = Provider.of<UserProvider>(context).getUser;
    return widget.snap['id_destinateur'] == '${utilisateur?.id_utlisateur}'
        ? Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    //  color: Color.fromARGB(255, 19, 19, 19),
                    border: Border.all(color: Colors.white24, width: 0.3),
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 8),
                          child: Container(
                            child: Center(
                              child: Container(
                                height: 55,
                                width: 55,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        widget.snap['photoProfile'].toString(),
                                    placeholder: (context, url) =>
                                        CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 200,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.snap['nom_utilisateur'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width > 630
                                    ? 20
                                    : 0),
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    DateFormat.yMd().format(widget
                                        .snap['tempPublication']
                                        .toDate()),
                                    style: TextStyle(
                                        color: Colors.white60,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Container(
                                width: 210,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.snap['message'].toString(),
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width > 630
                                    ? 20
                                    : 0),
                            Container(
                              child: Row(
                                children: [
                                  const Text(
                                    '             ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: checkBouton ? 0 : 10,
                        ),
                        widget.snap['CeConfirme'] == true || widget.snap['CeRefuser'] == true
                            ? Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 22, 38, 52) ,
                                   
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: widget.snap['CeConfirme'] == true ? Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical:9.0, horizontal: 35),
                                        child: Text('vous avez accepté la demande ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),),
                                      )
                                    ],
                                  ) : widget.snap['CeRefuser'] == true ? Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical:9.0, horizontal: 35),
                                        child: Text('Rendez-vous refusé', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ): Container()
                                ) ,
                              ],
                            )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Poste_rendez_vous(
                                                    snap: widget.snap,
                                                  )));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              Color.fromARGB(210, 0, 112, 203)),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () async {
                                              await ConfirmerRdv();

                                              setState(() {
                                                checkBouton = true;
                                                comfirme_rdv = true;
                                              });

                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Poste_rendez_vous(
                                                                snap:
                                                                    widget.snap,
                                                              )));

                                              
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Confirmer Rdv',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width >
                                              630
                                          ? 20
                                          : 10),
                                  GestureDetector(
                                    onTap: () async {
                                      // EffacerPub();
                                      // if (supprimer) {
                                       await Refuser(
                                            '${utilisateur?.nom_utlisateur}',
                                            '${utilisateur?.photo_profil}',
                                            '${utilisateur?.descriptio}',
                                            widget.snap['id_demandeur']
                                                .toString());

                                        effacerDemande();
                                        RefuserRdv();
                                      // }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          // border: Border.all(
                                          //   color: Colors.white30
                                          // )
                                          color: Colors.white12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              'Réfuser Rdv',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ],
                )),
          )
        : Container();
  }
}
