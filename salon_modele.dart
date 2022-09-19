import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Salon {
  final String nom_administrateur;
  final String description_administrateur;
  final String administrateurId;
  final String photoProfileAdmin;
  final  tempPublication;
  final String salonId;
  final List notation;
  final List MembresId;

  Salon(
      this.nom_administrateur,
      this.description_administrateur,
      this.administrateurId,
      this.photoProfileAdmin,
     
      this.salonId,
      this.notation,
      this.MembresId, this.tempPublication);

  Map<String, dynamic> mettre_en_json() => {
        'nom_administrateur': nom_administrateur,
        'description_administrateur': description_administrateur,
        'administrateurId': administrateurId,
        'photoProfileAdmin': photoProfileAdmin,
       
        'salonId': salonId,
        'notation': notation,
        'MembresId': MembresId,
        'tempPublication':tempPublication
      };

  static Salon deconvertir_depuis_json(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Salon(
      snapshot['nom_administrateur'],
      snapshot['description_administrateur'],
      snapshot['administrateurId'],
      snapshot['photoProfileAdmin'],
     
      snapshot['salonId'],
      snapshot['notation'],
      snapshot['MembresId'],
      snapshot['tempPublication']
    );
  }
}
