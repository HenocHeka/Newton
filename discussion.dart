import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/modeles_cartes_poster/message_salon.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';
import 'package:our_social_app/ressources/creer_salon.dart';
import 'package:our_social_app/ressources/utilisateur_provider.dart';
import 'package:provider/provider.dart';

import '../constantes/zone_de_saisie.dart';
import '../modeles/modele_utilisateur.dart';

class DiscussionSession extends StatefulWidget {
  final snap;
  const DiscussionSession({Key? key, required this.snap}) : super(key: key);

  @override
  State<DiscussionSession> createState() => _DiscussionSessionState();
}

class _DiscussionSessionState extends State<DiscussionSession> {
  final TextEditingController commentaireController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    commentaireController.dispose();
  }

  void PosterMessage(String nom_utilisateur, String description,
      String photoProfile, String utilisateurId, String message) async {
    try {
      String requette = await Creation_Salon().EnvoyerMessage(
          nom_utilisateur,
          description,
          photoProfile,
          utilisateurId,
          message,
          widget.snap['salonId'].toString());
      if (requette == 'success') {
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
      backgroundColor: Color.fromARGB(255, 12, 17, 22),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 17, 22),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Mobile_home_ecran()));
            },
            icon: Icon(
              CupertinoIcons.arrow_left_circle,
              color: Colors.white,
            )),
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                height: 44,
                width: 44,
                child: ClipOval(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: widget.snap['photoProfileAdmin'].toString(),
                    placeholder: (context, url) => CupertinoActivityIndicator(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.snap['nom_administrateur'].toString(),
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  '@Administrateur du Salon',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            child: Container(
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 26, 26, 26),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.ellipsis_vertical_circle,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
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
                      Container(
                        padding: EdgeInsets.only(top: 1),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height > 850
                            ? 760
                            : MediaQuery.of(context).size.height > 800
                                ? 690
                                : 660,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('Salon')
                                .doc(widget.snap['salonId'])
                                .collection('Chat_Salon')
                                .orderBy('tempPublication', descending: false)
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: CupertinoActivityIndicator(
                                      color: Colors.white),
                                );
                              }

                              return ListView.builder(
                                  itemCount:
                                      (snapshot.data! as dynamic).docs.length,
                                  itemBuilder: (context, index) {
                                    return MessageSalon(
                                      snap: (snapshot.data! as dynamic)
                                          .docs[index]
                                          .data(),
                                    );
                                  });
                            }),
                      ),
                      Positioned(
                        bottom: 2,
                        right: 2,
                        left: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 12, 17, 22),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                            height: 44,
                                            width: 46,
                                            child: ClipOval(
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    '${utilisateur?.photo_profil}',
                                                placeholder: (context, url) =>
                                                    CupertinoActivityIndicator(
                                                  color: Colors.white,
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
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 17.0, left: 9),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  630
                                              ? 260
                                              : 250,
                                          child: Zone_de_saisie_message(
                                              readOnly: false,
                                              maxlines: 2,
                                              textInputType: TextInputType.text,
                                              textEditingController:
                                                  commentaireController,
                                              hintext:
                                                  'Ecrire en tant que ${utilisateur?.nom_utlisateur} '),
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        PosterMessage(
                                            '${utilisateur?.nom_utlisateur}',
                                            '${utilisateur?.descriptio}',
                                            '${utilisateur?.photo_profil}',
                                            '${utilisateur?.id_utlisateur}',
                                            commentaireController.text);
                                        setState(() {
                                          commentaireController.text = '';
                                        });
                                      },
                                      icon: Icon(
                                        Icons.send,
                                        color: Colors.blue,
                                        size: 30,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      
    );
  }
}
