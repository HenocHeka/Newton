import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future Recuperateur_Image( ImageSource source) async{
  final ImagePicker _imagePicker = ImagePicker();
  try{
    XFile? file = await _imagePicker.pickImage(source: source);
     if (file != null){
    return await file.readAsBytes();
    print('No image selected');
  }
  }catch(e){}

 
}

