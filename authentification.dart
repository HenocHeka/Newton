import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/modeles/modele_utilisateur.dart';



class Authentification{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> Authentifier({
    required String email,
    required String mot_de_passe,
  }) async {
      String req = 'Erreur Eventuelle Produite';
    try{
      if(email.isNotEmpty || mot_de_passe.isNotEmpty){

       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: mot_de_passe);
      req = 'success';
      }else{
        req = 'Remplissez tous les champs !!';
      }
    }
    catch(err){
      req = err.toString();
    }

    return req;


  }



  Future<void> Se_deconnecter() async{
      await _firebaseAuth.signOut();
  }






}