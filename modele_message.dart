import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String nom_utilisateur;
  final String description;
  final String photoProfile;
  final String utilisateurId;
  final String message;
  final String messageId;
  final String salonId;
  final tempPublication;
  final Likes;

  Message(
      this.nom_utilisateur,
      this.description,
      this.photoProfile,
      this.utilisateurId,
      this.message,
      this.messageId,
      this.salonId,
      this.tempPublication,
      this.Likes);

  Map<String, dynamic> mettre_en_json() => {
        'nom_utilisateur': nom_utilisateur,
        'description': description,
        'photoProfile': photoProfile,
        'utilisateurId': utilisateurId,
        'message': message,
        'messageId': messageId,
        'salonId': salonId,
        'tempPublication': tempPublication,
        'Likes': Likes,
      };


  static Message deconvertir_depuis_json(DocumentSnapshot snap){
      var snapshot = snap.data() as Map<String, dynamic>;
    return Message(
      snapshot['nom_utilisateur'],
      snapshot['description'], 
      snapshot['photoProfile'], 
      snapshot['utilisateurId'], 
      snapshot['message'], 
      snapshot['messageId'], 
      snapshot['salonId'],
      snapshot['tempPublication'], 
      snapshot['Likes']);
  }
}
