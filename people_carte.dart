
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/ressources/demande_rendez_vous.dart';
import 'package:provider/provider.dart';

import '../modeles/modele_utilisateur.dart';
import '../ressources/utilisateur_provider.dart';

class PeopleCarte extends StatefulWidget {
  final snap;
  const PeopleCarte({Key? key, required this.snap}) : super(key: key);

  @override
  State<PeopleCarte> createState() => _PeopleCarteState();
}

class _PeopleCarteState extends State<PeopleCarte> {
  bool checkDemande = false;
  void DemandeRdv(
    String nom_utilisateur,
    String photoProfile,
    String id_demandeur,
    String id_destinateur,
   
  ) async {
       setState(() {
        checkDemande = true;
      });
    try {
   
      String requette = await DemandeRendezV()
          .DemandeRendezVous(nom_utilisateur, photoProfile, id_destinateur,id_demandeur);
      if (requette == 'success') {
          setState(() {
        checkDemande = false;
      });
        afficheur_snackBar('Demande envoyée', context);
      } else {
          setState(() {
        checkDemande = false;
      });
        afficheur_snackBar(requette, context);
      }
    } catch (err) {
        setState(() {
        checkDemande = false;
      });
      afficheur_snackBar(err.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    Utilisateur? utilisateur = Provider.of<UserProvider>(context).getUser;
    return widget.snap['id_utlisateur'] == '${utilisateur?.id_utlisateur}'
        ? Container()
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
            child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 0),
                          child: Container(
                            margin: EdgeInsets.only(right:25),
                            child:
                                widget.snap['photo_profil'].toString() == null
                                    ? Center(
                                        child: CupertinoActivityIndicator(
                                          color: Colors.blue,
                                        ),
                                      )
                                    : Center(
                                        child: Container(
                                          height: 60,
                                          width: 60,
                                          child: ClipOval(
                                            
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: widget.snap['photo_profil'].toString(),
                                              placeholder: (context, url) => CupertinoActivityIndicator(color: Colors.white,),
                                             ),
                                          ),
                                        ),
                                      ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 210,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.snap['nom_utlisateur'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17),
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
                                    '',
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
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '@' +
                                            widget.snap['descriptio']
                                                .toString(),
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontWeight: FontWeight.bold))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 6,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    // border: Border.all(
                                    //   color: Colors.white30
                                    // )
                                    color: Colors.white12),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Suivre ',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width > 630
                                    ? 10
                                    : 10),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: checkDemande ? Colors.white12 : Color.fromARGB(210, 0, 117, 212)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        DemandeRdv(
                                            '${utilisateur?.nom_utlisateur}',
                                            '${utilisateur?.photo_profil}',
                                             '${utilisateur?.id_utlisateur}',
                                              widget.snap['id_utlisateur'].toString());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'Demandez Rdv',
                                          style: TextStyle(
                                              color: Color.fromARGB(255, 244, 244, 244),
                                              fontWeight: FontWeight.bold),
                                        ),
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
          );
  }
}
