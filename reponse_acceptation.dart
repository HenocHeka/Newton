import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/modeles/acceptation.dart';
import 'package:uuid/uuid.dart';

class AcceptationDemande {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;
  String messageerreur = 'Erreur Eventuelle';
  final String msg = 'a accepté le Rdv';

  Future<String> AccepterDemande(
    final String nom_utilisateur,
    final String photoProfile,
    final String description,
    final String id_destinateur,

    final String descriptio_rendez_vous,
    final dateReception,
    final String heureDebutReception,
    final String heureFinReception,
    final String tempEntretien,
    final String lieu,
  ) async {
    try {
      String accepteId = Uuid().v1();

      Acceptation acceptation = Acceptation(
          nom_utilisateur,
          photoProfile,
          id_destinateur,
          DateTime.now(),
          msg,
          description,
          accepteId,
          descriptio_rendez_vous,
          dateReception,
          heureDebutReception,
          heureFinReception,
          tempEntretien,
          lieu,
          'confirmation',
          );

      _firebase
          .collection('Demande_Acceptée')
          .doc(accepteId)
          .set(acceptation.mettre_en_json());
      messageerreur = 'succes';
    } catch (err) {
      messageerreur = err.toString();
    }

    return messageerreur;
  }

Future<String> RefuserDemande(
   final String nom_utilisateur,
    final String photoProfile,
    final String description,
    final String id_destinateur,
) async {
  try{
    String refuseId = Uuid().v1();

    Refus refus = Refus(
      nom_utilisateur, 
      photoProfile, 
      description, 
      id_destinateur, 

      'refus',
       DateTime.now(),
       refuseId);

       _firebase
          .collection('Demande_Acceptée')
          .doc(refuseId)
          .set(refus.mettre_en_json());

    

    messageerreur = 'success';

  }catch(err){
    messageerreur = err.toString();

  }

  return messageerreur;

}
















  Future<void> EffacerDemande(String demandeId) async {
    try {
      await _firebaseFirestore
          .collection('Demande_Rendez_vous')
          .doc(demandeId)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
   Future<void> EffacerNotification(String accepteId) async {
    try {
      await _firebaseFirestore
          .collection('Demande_Acceptée')
          .doc(accepteId)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
