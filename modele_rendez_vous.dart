import 'package:cloud_firestore/cloud_firestore.dart';

class Rendez_vous {
  final String nom_utlisateur;
  final String id_utlisateur;
  final String photo_profil;
  final String descriptio_rendez_vous;
  final String rende_Vous_PostId;
  final  dateReception;
  final  heureDebutReception; 
  final  heureFinReception;
  final Likes;
  final tempPublication;

  Rendez_vous(
      this.nom_utlisateur,
      this.id_utlisateur,
      this.photo_profil,
      this.descriptio_rendez_vous,
      this.dateReception,
      this.heureDebutReception,
      this.heureFinReception,
      this.Likes,
      this.tempPublication, this.rende_Vous_PostId, );


     Map<String, dynamic> mettre_en_format_Json() => {
        'nom_utlisateur': nom_utlisateur,
        'id_utlisateur': id_utlisateur,
        'photo_profil': photo_profil,
        'descriptio_rendez_vous': descriptio_rendez_vous,
        'dateReception': dateReception,
        'heureDebutReception':heureDebutReception,
        'heureFinReception': heureFinReception,
        'Likes': Likes,
        'tempPublication': tempPublication,
        'rende_Vous_PostId':rende_Vous_PostId,
      
       
      };


       static Rendez_vous deconvertir_depuis_format_Json(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return Rendez_vous(
      snapshot['nom_utlisateur'],
      snapshot['id_utlisateur'],
      snapshot['photo_profil'],
      snapshot['descriptio_rendez_vous'],
      snapshot['dateReception'],
      snapshot['heureDebutReception'],
      snapshot['heureFinReception'],
      snapshot['Likes'],
      snapshot['tempPublication'],
      snapshot['rende_Vous_PostId'],
    
     
      
      );

  }
}

