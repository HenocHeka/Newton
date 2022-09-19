import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:our_social_app/modeles/modele_rendez_vous.dart';
import 'package:our_social_app/ressources/inscription_methode.dart';

class Utilisateur {
  final String nom_utlisateur;
  final String id_utlisateur;
  final String photo_profil;
  final String descriptio;
  final String mot_de_passe;
  final List inscripts;
  final List abonnes;
  final List abonnements;
  final List inscription;
  // final List rendezvous;
   final String email;
 
 
 
  Utilisateur( 
      this.nom_utlisateur,
      this.id_utlisateur,
      this.photo_profil,
      this.descriptio,
      this.inscripts,
      this.abonnes,
      this.abonnements,
      this.inscription,
       this.email, 
      //  this.rendezvous, 
       this.mot_de_passe,
      
      );


 
  Map<String, dynamic> mettre_en_format_Json()=>{
    'nom_utlisateur':nom_utlisateur,
    'id_utlisateur':id_utlisateur,
    'photo_profil':photo_profil,
    'descriptio':descriptio,
    'inscripts':inscripts,
    'abonnes':abonnes,
    'abonnements':abonnements,
    'inscription':inscription,
    // 'rendezvous':rendezvous,
    'email':email,
    'mot_de_passe':mot_de_passe
     
   
   
    
  };


  static Utilisateur fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return Utilisateur(
      snapshot['nom_utlisateur'],
      snapshot['id_utlisateur'],
      snapshot['photo_profil'],
      snapshot['descriptio'],
      snapshot['inscripts'],
      snapshot['abonnes'],
      snapshot['abonnements'],
      snapshot['inscription'],
      // snapshot['rendezvous'],
      snapshot['email'],
      snapshot['mot_de_passe'],
      
      );
  }

}

