import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Envoi_Image {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

//Methode pour uploader les images
  Future<String> UploaderImage(
      String childname, Uint8List file, bool ceposte) async {
          // Creer le dossier de sauvergarde
        Reference ref =  _firebaseStorage.ref().child(childname).child(_auth.currentUser!.uid);

        if(ceposte){
          String id = Uuid().v1();
          ref = ref.child(id);
        }
        // uploader l'image dans Firebase_Storage
        UploadTask uploadTask =  ref.putData(file);

        
        
        // Recuperation du lien url de l'image dans Firebase_Storage  
        TaskSnapshot snap = await uploadTask; 
        String downlongUrl = await snap.ref.getDownloadURL();

        return downlongUrl; 
      }
}
