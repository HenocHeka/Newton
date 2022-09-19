import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Acceptation {
  final String nom_utilisateur;
  final String photoProfile;
  final String description;
  final String id_destinateur;
  final String message;
  final String accepteId;
  final String descriptio_rendez_vous;
  final String lieu;
  final String typeNotification;
  final String tempEntretien;
  
  final dateReception;
  final heureDebutReception;
  final heureFinReception;
  final tempPublication;

  Acceptation(
    this.nom_utilisateur,
    this.photoProfile,
    this.id_destinateur,
    this.tempPublication,
    this.message,
    this.description,
    this.accepteId,
    this.descriptio_rendez_vous,
    this.dateReception,
    this.heureDebutReception,
    this.heureFinReception,
    this.tempEntretien,
    this.lieu,
    this.typeNotification,
  );

  Map<String, dynamic> mettre_en_json() => {
        'nom_utilisateur': nom_utilisateur,
        'photoProfile': photoProfile,
        'id_destinateur': id_destinateur,
        'tempPublication': tempPublication,
        'message': message,
        'description': description,
        'accepteId': accepteId,
        'descriptio_rendez_vous': descriptio_rendez_vous,
        'dateReception': dateReception,
        'heureDebutReception': heureDebutReception,
        'heureFinReception': heureFinReception,
        'tempEntretien': tempEntretien,
        'lieu': lieu,
        'typeNotification': typeNotification
      };

  static Acceptation deconvertir_depuis_json(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Acceptation(
        snapshot['nom_utilisateur'],
        snapshot['photoProfile'],
        snapshot['id_destinateur'],
        snapshot['tempPublication'],
        snapshot['message'],
        snapshot['description'],
        snapshot['accepteId'],
        snapshot['descriptio_rendez_vous'],
        snapshot['dateReception'],
        snapshot['heureDebutReception'],
        snapshot['heureFinReception'],
        snapshot['tempEntretien'],
        snapshot['lieu'],
        snapshot['typeNotification']);
  }
}

class Refus {
  final String nom_utilisateur;
  final String photoProfile;
  final String description;
  final String id_destinateur;
 final String refusId;
  final  tempPublication;
  final String typeNotification;

  Refus(this.nom_utilisateur, this.photoProfile, this.description,
      this.id_destinateur,  this.typeNotification, this.tempPublication, this.refusId);

  Map<String, dynamic> mettre_en_json() => {
        'nom_utilisateur': nom_utilisateur,
        'photoProfile': photoProfile,
        'description': description,
        'id_destinateur': id_destinateur,
     'refusId':refusId,
        'typeNotification': typeNotification,
        'tempPublication':tempPublication
      };

  static Refus deconvertir_depuis_json(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Refus(
      snapshot['nom_utilisateur'],
      snapshot['photoProfile'],
      snapshot['description'],
      snapshot['id_destinateur'],
  snapshot['refusId'],
      snapshot['typeNotification'],
      snapshot['tempPublication'],
      
    );
  }
}
