import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/modeles/modele_rendez_vous.dart';
import 'package:uuid/uuid.dart';

class UploaderRendezVous {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  String message = 'Erreur Eventuelle Produite';

  Future<String> PosterRendezVous({
    required String nom_utilisateur,
    required String id_utilisateur,
    required String profileImage,
    required String description,
    required final dateReception,
    required String heureDebut,
    required String heureFin,
    required String lieuEntretien,
    required String tempsEntretien,
    required String demandeAccepteId,
    required String demandeId,
    
  }) async {
    
    try {
    
        String accepteId = const Uuid().v1();

        Rendez_vous monRendezVous = Rendez_vous(
            nom_utilisateur,
            id_utilisateur,
            profileImage,
            description,
            dateReception,
            heureDebut,
            heureFin,
            [],
            DateTime.now(),
            accepteId,
           );

        _firebaseFirestore
           .collection('Demande_Rendez_vous')
          .doc(demandeId)
          .collection('Demande_Acceptée')
          .doc(demandeId)
          .collection('Information_rendez_vous')
          .doc(accepteId)
          .set(monRendezVous.mettre_en_format_Json());

      
    

      message = 'success';
    } catch (err) {
      message = err.toString();
    }
    return message;
  }
}
