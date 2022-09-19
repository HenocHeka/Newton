import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/constantes/zone_de_saisie.dart';

class Page_recherche extends StatefulWidget {
  const Page_recherche({Key? key}) : super(key: key);

  @override
  State<Page_recherche> createState() => _Page_rechercheState();
}

class _Page_rechercheState extends State<Page_recherche> {
  final TextEditingController _recherchecontrolleur = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _recherchecontrolleur.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 12, 17, 22),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 12, 17, 22),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(CupertinoIcons.arrow_left_circle, color: Colors.white,)),
        title: 
            Container(
               decoration: BoxDecoration(
                      color: champ_saisie_couleur,
                      borderRadius: BorderRadius.circular(10)),
           
              child: Row(
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(CupertinoIcons.search, color: Colors.white24,),
                ),
                  Container(
                  height: 40,
                  width: 230,
                  child: Zone_de_saisie_publication(
                    readOnly: false,
                    maxlines: 1,
                    textInputType: TextInputType.text,
                    hintext: 'Rechercher sur Ubwakeme ',
                    textEditingController:_recherchecontrolleur ,
                  ),
          ),
                ],
              ),
            ),
         
          
     
        centerTitle: true,
      ),
    );
  }
}
