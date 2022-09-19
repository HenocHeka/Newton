import 'package:cloud_firestore/cloud_firestore.dart';

class Cours {
  final String nom_utlisateur;
  final String id_utlisateur;
  final String photo_profil;
  final String descriptio_postes;
  final String conference_cours_postId;
  final String photoPublier;
  final String frais;
  final String lieu;
  final String nomcours;
  final heureDebut;
  final heureFin;
  final inscript;
  final Likes;
  final tempPublication;

  Cours(
      this.nom_utlisateur,
      this.id_utlisateur,
      this.photo_profil,
      this.descriptio_postes,
      this.conference_cours_postId,
      this.photoPublier,
      this.inscript,
      this.Likes,
      this.tempPublication,
      this.heureDebut, 
      this.heureFin,
       this.frais,
        this.lieu, 
        this.nomcours);



  Map<String, dynamic> mettre_en_format_Json()=>{
    'nom_utlisateur':nom_utlisateur,
    'id_utlisateur':id_utlisateur,
    'photo_profil':photo_profil,
    'descriptio_postes':descriptio_postes,
    'autre_postId':conference_cours_postId,
    'photoPublier':photoPublier,
    'tempPublication':tempPublication,
    'inscript':inscript,
    'Likes':Likes,
    'heureDebut':heureDebut,
    'heureFin':heureFin,
    'frais':frais,
    'lieu':lieu,
    'nomcours':nomcours
    
  };

  static Cours deconvertir_depuis_format_Json(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return Cours(
      snapshot['nom_utlisateur'],
      snapshot['id_utlisateur'],
      snapshot['photo_profil'],
      snapshot['descriptio_postes'],
      snapshot['conference_cours_postId'],
      snapshot['photoPublier'],
      snapshot['inscript'],
      snapshot['Likes'],
      snapshot['tempPublication'],
      snapshot['heureDebut'],
      snapshot['heureFin'],
      snapshot['frais'],
      snapshot['nomcours'],
      snapshot['lieu']
     
      );
  }

}


class CoursGratuit {
  final String nom_utlisateur;
  final String id_utlisateur;
  final String photo_profil;
  final String descriptionUtilisateur;
  final String descriptio_postes;
  final String conference_cours_postId;
  final String photoPublier;
  final String mode;
  final String lieu;
  final String nomcours;
  final String typePoste;
  final String montant;
  final heureDebut;
  final heureFin;
  final inscript;
  final Likes;
  final tempPublication;
   final dateCours;

  CoursGratuit(
      this.nom_utlisateur,
      this.id_utlisateur,
      this.photo_profil,
      this.descriptio_postes,
      this.conference_cours_postId,
      this.photoPublier,
      this.inscript,
      this.Likes,
      this.tempPublication,
      this.heureDebut, 
      this.heureFin,
    
        this.lieu, 
        this.nomcours,
         this.mode,
          this.dateCours,
           this.typePoste, this.montant, 
           this.descriptionUtilisateur);



  Map<String, dynamic> mettre_en_format_Json()=>{
    'nom_utlisateur':nom_utlisateur,
    'id_utlisateur':id_utlisateur,
    'photo_profil':photo_profil,
    'descriptio_postes':descriptio_postes,
    'cours_postId':conference_cours_postId,
    'photoPublier':photoPublier,
    'tempPublication':tempPublication,
    'inscript':inscript,
    'Likes':Likes,
    'heureDebut':heureDebut,
    'heureFin':heureFin,
    'mode':mode,
    'lieu':lieu,
    'nomcours':nomcours,
    'dateCours':dateCours,
    'typePoste':typePoste,
    'montant':montant,
    'descriptionUtilisateur':descriptionUtilisateur
    
  };

  static CoursGratuit deconvertir_depuis_format_Json(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return CoursGratuit(
      snapshot['nom_utlisateur'],
      snapshot['id_utlisateur'],
      snapshot['photo_profil'],
      snapshot['descriptio_postes'],
      snapshot['cours_postId'],
      snapshot['photoPublier'],
      snapshot['inscript'],
      snapshot['Likes'],
      snapshot['tempPublication'],
      snapshot['heureDebut'],
      snapshot['heureFin'],
      snapshot['lieu'],
      snapshot['nomcours'],
      snapshot['mode'],
      snapshot['dateCours'],
      snapshot['typePoste'],
      snapshot['montant'],
      snapshot['descriptionUtilisateur']
   
     
      );
  }

}


class CoursNoPhoto {
  final String nom_utlisateur;
  final String id_utlisateur;
  final String photo_profil;
  final String descriptionUtilisateur;
  final String descriptio_postes;
  final String conference_cours_postId;
  final String photoPublier;
  final String mode;
  final String lieu;
  final String nomcours;
 
  final heureDebut;
  final heureFin;
  final inscript;
  final Likes;
  final tempPublication;
   final dateCours;
   final montant;
   final String typePoste;

  CoursNoPhoto(
      this.nom_utlisateur,
      this.id_utlisateur,
      this.photo_profil,
      this.descriptio_postes,
      this.conference_cours_postId,
    
      this.inscript,
      this.Likes,
      this.tempPublication,
      this.heureDebut, 
      this.heureFin,
    
        this.lieu, 
        this.nomcours,
         this.mode,
          this.dateCours,
           this.photoPublier,
            this.typePoste, this.montant, this.descriptionUtilisateur);



  Map<String, dynamic> mettre_en_format_Json()=>{
    'nom_utlisateur':nom_utlisateur,
    'id_utlisateur':id_utlisateur,
    'photo_profil':photo_profil,
    'descriptio_postes':descriptio_postes,
    'cours_postId':conference_cours_postId,
    'photoPublier':photoPublier,
    'tempPublication':tempPublication,
    'inscript':inscript,
    'Likes':Likes,
    'heureDebut':heureDebut,
    'heureFin':heureFin,
    'mode':mode,
    'lieu':lieu,
    'nomcours':nomcours,
    'dateCours':dateCours,
    'typePoste':typePoste,
    'montant':montant,
    'descriptionUtilisateur':descriptionUtilisateur
    
  };

  static CoursNoPhoto deconvertir_depuis_format_Json(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return CoursNoPhoto(
      snapshot['nom_utlisateur'],
      snapshot['id_utlisateur'],
      snapshot['photo_profil'],
      snapshot['descriptio_postes'],
      snapshot['cours_postId'],
      snapshot['photoPublier'],
       snapshot['inscript'],
      snapshot['Likes'],
      snapshot['tempPublication'],
      snapshot['heureDebut'],
      snapshot['heureFin'],
      snapshot['lieu'],
      snapshot['nomcours'],
      snapshot['mode'],
      snapshot['dateCours'],
      snapshot['typePoste'],
      snapshot['montant'],
      snapshot['descriptionUtilisateur']
   
     
      );
  }

}