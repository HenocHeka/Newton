import 'package:cloud_firestore/cloud_firestore.dart';

class Perso_Postes {
  final String nom_utlisateur;
  final String id_utlisateur;
  final String photo_profil;
  final String descriptionUtilisateur;
  final String descriptio_postes;
  final String perso_postId;
  final String photoPublier;
  final String typePoste;
 
  final Likes;
  final tempPublication;
 
  Perso_Postes( 
      this.nom_utlisateur,
      this.id_utlisateur,
      this.photo_profil,
      this.descriptio_postes,
      this.perso_postId,
      this.photoPublier,
    
      this.Likes,
      this.tempPublication,
       this.typePoste,
        this.descriptionUtilisateur);


 
  Map<String, dynamic> mettre_en_format_Json()=>{
    'nom_utlisateur':nom_utlisateur,
    'id_utlisateur':id_utlisateur,
    'photo_profil':photo_profil,
    'descriptio_postes':descriptio_postes,
    'perso_postId':perso_postId,
    'photoPublier':photoPublier,
    'tempPublication':tempPublication,
   
    'Likes':Likes,
    'typePoste':typePoste,
    'descriptionUtilisateur':descriptionUtilisateur
    
  };


  static Perso_Postes deconvertir_depuis_format_Json(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Perso_Postes(
      snapshot['nom_utlisateur'],
      snapshot['id_utlisateur'],
      snapshot['photo_profil'],
      snapshot['descriptio_postes'],
      snapshot['perso_postId'],
      snapshot['photoPublier'],
      snapshot['tempPublication'],
      snapshot['Likes'],
      snapshot['typePoste'],
      snapshot['descriptionUtilisateur']
     
     
      );
  }

}

class Poste_Msg {
  final String nom_utlisateur;
  final String id_utlisateur;
  final String photo_profil;
  final String descriptionUtilisateur;
  final String descriptio_postes;
  final String perso_postId;
  final String photoPublier;
  final String typePoste;
  final Likes;
  final tempPublication;
 
  Poste_Msg( 
      this.nom_utlisateur,
      this.id_utlisateur,
      this.photo_profil,
      this.descriptio_postes,
      this.perso_postId,
 
    
      this.Likes,
      this.tempPublication, this.photoPublier, this.typePoste, this.descriptionUtilisateur);


 
  Map<String, dynamic> mettre_en_format_Json()=>{
    'nom_utlisateur':nom_utlisateur,
    'id_utlisateur':id_utlisateur,
    'photo_profil':photo_profil,
    'descriptio_postes':descriptio_postes,
    'perso_postId':perso_postId,
    'photoPublier':photoPublier,
    'tempPublication':tempPublication,
    'Likes':Likes,
    'typePoste':typePoste,
    'descriptionUtilisateur':descriptionUtilisateur

    
  };


  static Poste_Msg deconvertir_depuis_format_Json(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Poste_Msg(
      snapshot['nom_utlisateur'],
      snapshot['id_utlisateur'],
      snapshot['photo_profil'],
      snapshot['descriptio_postes'],
      snapshot['photoPublier'],
      snapshot['perso_postId'],
      snapshot['tempPublication'],
      snapshot['Likes'],
      snapshot['typePoste'],
      snapshot['descriptionUtilisateur']
     
     
      );
  }

}