import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/modeles/modele_message.dart';
import 'package:our_social_app/modeles/salon_modele.dart';
import 'package:uuid/uuid.dart';

class Creation_Salon {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  String message_retour = 'Erreur Eventuelle';

  Future<String> CreerSalon(
    String nom_administrateur,
    String description_administrateur,
    String administrateurId,
    String photoProfileAdmin,
  ) async {
    try {
      String salonId = Uuid().v1();

      Salon salon = Salon(nom_administrateur, description_administrateur,
          administrateurId, photoProfileAdmin, salonId, [], [], DateTime.now());

      firebaseFirestore
          .collection('Salon')
          .doc(salonId)
          .set(salon.mettre_en_json());

      message_retour = 'success';
    } catch (err) {
      message_retour = err.toString();
    }

    return message_retour;
  }

  Future<String> EnvoyerMessage(
      final String nom_utilisateur,
      final String description,
      final String photoProfile,
      final String utilisateurId,
      final String message,
      final String salonId) async {
    try {
      String messageId = Uuid().v1();

      Message _message = Message(
        nom_utilisateur, 
        description, 
        photoProfile,
        utilisateurId, 
        message, 
        messageId, 
        salonId, 
        DateTime.now(), 
        []);


        firebaseFirestore
          .collection('Salon')
          .doc(salonId)
          .collection('Chat_Salon')
          .doc(messageId)
          .set(
            _message.mettre_en_json());

      message_retour = 'success';
      
    } catch (err) {
      message_retour = err.toString();
    }
    return message_retour;
  }
}
