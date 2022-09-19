import 'package:flutter/material.dart';
import 'package:our_social_app/modeles/modele_utilisateur.dart';
import 'package:our_social_app/ressources/authentification.dart';
import 'package:our_social_app/ressources/inscription_methode.dart';

class UserProvider with ChangeNotifier{
         Utilisateur? _user ;
     
      final Inscription _authMethods = Inscription();

      Utilisateur? get getUser {
        var user2 = _user;
        late Utilisateur? user = user2;
        return user;
      }

  Future<void> refreshUser() async{
    Utilisateur user = await _authMethods.getUserDetails();
  _user = user;
  notifyListeners();
  } 

}