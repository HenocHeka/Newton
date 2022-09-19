import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Demande {
  final String nom_utilisateur;
  final String photoProfile;
  final String id_demandeur;
  final String id_destinateur;
  final String message;
  final String demandeId;
  final bool CeConfirme;
  final bool CeRefuser;
  final  tempPublication;

  Demande(
    this.nom_utilisateur,
    this.photoProfile,
    this.id_destinateur,
    this.tempPublication,
    this.message, this.id_demandeur, this.demandeId, this.CeConfirme, this.CeRefuser,
  );

  Map<String, dynamic> mettre_en_json() => {
        'nom_utilisateur': nom_utilisateur,
        'photoProfile': photoProfile,
        'id_destinateur': id_destinateur,
        'tempPublication': tempPublication,
        'message': message,
        'id_demandeur':id_demandeur,
        'demandeId':demandeId,
        'CeConfirme':CeConfirme,
        'CeRefuser':CeRefuser

      };

  static Demande deconvertir_depuis_json(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Demande(
        snapshot['nom_utilisateur'],
        snapshot['photoProfile'],
        snapshot['id_destinateur'],
        snapshot['tempPublication'],
        snapshot['message'],
        snapshot['id_demandeur'],
        snapshot['demandeId'],
        snapshot['CeConfirme'],
        snapshot['CeRefuser']
        );
  }
}
