import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/modeles/modele_perso.dart';
import 'package:our_social_app/ressources/upload_photo.dart';
import 'package:uuid/uuid.dart';

class UploaderPoste {

  final FirebaseFirestore _Firestore = FirebaseFirestore.instance;

  Future<String> PosterAvecPhoto(
    String nom_utilisateur,
    String utilisateur_id,
    String utlisateurDescription,
    String description,
    String profilImage,
    Uint8List photoPubier,
  ) async {
    String message = ' Erreur Eventuelle';
    try {
      if (description.isNotEmpty || photoPubier != null) {
        String photoPub = await Envoi_Image()
            .UploaderImage('Publiciation', photoPubier, true);

        String postId = const Uuid().v1();

        Perso_Postes monPoste = Perso_Postes(nom_utilisateur, utilisateur_id,
            profilImage, description, postId, photoPub, [], DateTime.now(),'poste',utlisateurDescription);


        _Firestore.collection('Tout_les_Publications')
          .doc(postId)
          .set(monPoste.mettre_en_format_Json());
      }
      message = 'success';
    } catch (err) {
      message = err.toString();
    }

    return message;
  }

  Future<String> PosterSansPhoto(
    String nom_utilisateur,
    String utilisateur_id,
    String descriptionUtilisateur,
    String description,
    String profilImage,
  ) async {
    String message = ' Erreur Eventuelle';
    try {
      String postId = const Uuid().v1();

      Poste_Msg monPoste = Poste_Msg(nom_utilisateur, utilisateur_id,
          profilImage, description, postId, [], DateTime.now(),'','poste',descriptionUtilisateur);

     

      _Firestore.collection('Tout_les_Publications')
          .doc(postId)
          .set(monPoste.mettre_en_format_Json());

      message = 'success';
    } catch (err) {
      message = err.toString();
    }

    return message;
  }
}
