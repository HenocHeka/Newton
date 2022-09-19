import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/modeles/demande.dart';
import 'package:uuid/uuid.dart';

class DemandeRendezV {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  String messageretour = 'Erreur Eventuelle';
  String msg = 'Vous a envoyé une demande Rdv';

  Future<String> DemandeRendezVous(
      final String nom_utilisateur,
      final String photoProfile,
      final String id_destinateur,
      final String id_demandeur) async {
    try {
      String demandeId = Uuid().v1();

      Demande demande = Demande(nom_utilisateur, photoProfile, id_destinateur,
          DateTime.now(), msg, id_demandeur, demandeId, false, false);

      _firebaseFirestore
          .collection('Demande_Rendez_vous')
          .doc(demandeId)
          .set(demande.mettre_en_json());
      messageretour = 'success';
    } catch (err) {
      messageretour = err.toString();
    }

    return messageretour;
  }

  Future<void> ConfirmerRdv(
    String demandeId,
    bool CeConfirme,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('Demande_Rendez_vous').doc(demandeId).update({
        'CeConfirme':true
      });
    } catch (err) {
      print(err.toString());
    }
  }
  Future<void> ResufRdv(
    String demandeId,
    bool CeRefuser,
  ) async {
    try {
      await FirebaseFirestore.instance.collection('Demande_Rendez_vous').doc(demandeId).update({
        'CeRefuser':true
      });
    } catch (err) {
      print(err.toString());
    }
  }
}
