import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:our_social_app/ecrans/page_profile.dart';
import 'package:our_social_app/ecrans/page_recherche.dart';
import 'package:our_social_app/modeles_cartes_poster/poste_carte.dart';
import 'package:our_social_app/modeles_cartes_poster/rendezvous_carte.dart';
import 'package:provider/provider.dart';

import '../modeles/modele_utilisateur.dart';
import '../ressources/utilisateur_provider.dart';

class Fil_Actualite extends StatefulWidget {
  const Fil_Actualite({Key? key}) : super(key: key);

  @override
  State<Fil_Actualite> createState() => _Fil_ActualiteState();
}

class _Fil_ActualiteState extends State<Fil_Actualite> {
  @override
  Widget build(BuildContext context) {
    Utilisateur? utilisateur = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 17, 22),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 17, 22),
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: Container(
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 26, 26, 26),
            ),
            child: IconButton(
                onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Page_recherche())),
                icon: Icon(
                  CupertinoIcons.search,
                  color: Colors.white,
                )),
          ),
        ),
        title: Text('Ubwakeme', style: TextStyle()),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Page_profile())),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // color: Colors.black12,
                ),
                child: utilisateur?.photo_profil == null
                    ? Center(
                        child: CupertinoActivityIndicator(
                          color: Colors.white38,
                        ),
                      )
                    : Container(
                                          height: 45,
                                          width: 42,
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
          )
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Tout_les_Publications')
            .orderBy('tempPublication', descending: true)
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CupertinoActivityIndicator(color: Colors.white),
            );
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) =>
                  Poste_Carte(snap: snapshot.data!.docs[index].data()));
        },
      ),
    );
  }
}
