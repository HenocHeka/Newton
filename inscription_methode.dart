import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/ressources/upload_photo.dart';

import '../modeles/modele_utilisateur.dart';



class Inscription{

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
String message =' Erreur Eventuelle Produite !';

 Future<Utilisateur> getUserDetails() async{
    User currentUser = _firebaseAuth.currentUser!;

    DocumentSnapshot snap = await _firebaseFirestore.collection('Tous_les_utilisateurs').doc(currentUser.uid).get();

    return Utilisateur.fromSnap(snap);
  }

Future<String> Inscrire(
  String nom_utlisateur,
  String description,
  String email,
  String mot_de_passe,
  Uint8List profilephoto,
) async{

  try{
    if(nom_utlisateur.isNotEmpty || description.isNotEmpty || email.isNotEmpty || mot_de_passe.isNotEmpty|| profilephoto != null){

        UserCredential cred_utilisateur = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: mot_de_passe);

        String profilim = await Envoi_Image().UploaderImage('Photo_Profile', profilephoto, false);

       await _firebaseFirestore.collection('Tous_les_utilisateurs').doc(cred_utilisateur.user!.uid).set({
          'nom_utlisateur': nom_utlisateur,
          'id_utlisateur':cred_utilisateur.user!.uid ,
          'photo_profil': profilim,
          'descriptio':description,
          'inscripts': [],
          'abonnes':[],
          'abonnements':[],
          'inscription':[],
          'rendezvous':[],
          'email':email,
          'mot_de_passe':mot_de_passe,
          
          });




    } else{
      message = 'Remplissez tous les champs ';
    }
    message='success';
  } 
  catch(err){
    message = err.toString();
  }

    return message;

}






}