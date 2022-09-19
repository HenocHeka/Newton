import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/modeles/cours.dart';
import 'package:our_social_app/ressources/upload_photo.dart';
import 'package:uuid/uuid.dart';

class UploaderCours {
  
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String message = 'Erreur Eventuelle  ! Veuillez réessayer';

  Future<String> PosterCoursGratuitAvecImage(
   {
   required String nom_utilisateur,
   required String id_utilisateur,
   required String photoProfile,
   required String descriptionUtilisateur,
   required String description,
   required String nom_du_cours,
   required String lieuCours,
   required Uint8List photoPublier,
   required  String heureDeb,
   required String heureFin,
   required String montant,
   required String mode,
   required final dateCours,
   }
  ) async {
    try {
   
        String photoPub = await Envoi_Image()
            .UploaderImage('Publiciation', photoPublier, true);

        String postId = const Uuid().v1();

        CoursGratuit moncours = CoursGratuit(
            nom_utilisateur,
            id_utilisateur,
            photoProfile,
            description,
            postId,
            photoPub,
            [],
            [],
            DateTime.now(),
            heureDeb,
            heureFin,
            lieuCours,
            nom_du_cours,
            mode,
            dateCours,
            'cours',
            montant,
            descriptionUtilisateur);

       
        _firestore.collection('Tout_les_Publications')
          .doc(postId)
          .set(moncours.mettre_en_format_Json());
    

      message = 'success';
    } catch (err) {
      message = err.toString();
    }
    return message;
  }


   Future<String> PosterCoursGratuitSansImage(
   {
   required String nom_utilisateur,
   required  String id_utilisateur,
   required String descriptionUtilisateur,
   required String photoProfile,
   required String description,
   required String nom_du_cours,
   required String lieuCours,
 
   required  String heureDeb,
   required String heureFin,
   required String montant,
   required String mode,
   required final dateCours,
   }
  ) async {
    try {
   
       

        String postId = const Uuid().v1();

        CoursNoPhoto moncours = CoursNoPhoto(
            nom_utilisateur,
            id_utilisateur,
            photoProfile,
            description,
            postId,
            [],
            [],
            DateTime.now(),
            heureDeb,
            heureFin,
            lieuCours,
            nom_du_cours,
            mode,
            dateCours,
            '',
            'cours',
            montant,
            descriptionUtilisateur);

     
        _firestore.collection('Tout_les_Publications')
          .doc(postId)
          .set(moncours.mettre_en_format_Json());
    

      message = 'success';
    } catch (err) {
      message = err.toString();
    }
    return message;
  }
}
