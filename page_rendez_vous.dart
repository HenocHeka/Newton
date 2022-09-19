import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/ecrans/page_profile.dart';
import 'package:our_social_app/ecrans/page_recherche.dart';
import 'package:our_social_app/modeles_cartes_poster/rendezvous_carte.dart';

class Rendez_vous extends StatefulWidget {
  const Rendez_vous({Key? key}) : super(key: key);

  @override
  State<Rendez_vous> createState() => _Rendez_vousState();
}

class _Rendez_vousState extends State<Rendez_vous> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 12, 17, 22),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 12, 17, 22),
        elevation: 0,
        title: Text(
          'Rendez-vous',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Page_recherche())),
                  icon: Icon(
                    CupertinoIcons.search,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Demande_Rendez_vous')
            .orderBy('tempPublication',descending: true)
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
                  RendeVousCarte(snap: snapshot.data!.docs[index].data()));
        },
      ),
    );
  }
}
