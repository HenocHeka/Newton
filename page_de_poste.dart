import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/ecrans/poste_cours_encadrement.dart';
import 'package:our_social_app/ecrans/poste_pens%C3%A9e.dart';
import 'package:our_social_app/ecrans/poste_rendez_vous.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';

class Page_de_Poste extends StatefulWidget {
  final snap;
  const Page_de_Poste({Key? key,required this.snap}) : super(key: key);

  @override
  State<Page_de_Poste> createState() => _Page_de_PosteState();
}

class _Page_de_PosteState extends State<Page_de_Poste> {

  Widget model_grand_ecran() {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 42, 42),
                    borderRadius: BorderRadius.circular(10)),
                child: CupertinoButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Poste_rendez_vous(
                    snap: widget.snap,
                  ))),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Icon(
                            CupertinoIcons.calendar_badge_plus,
                            color: Colors.white,
                            size: 25,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publier un rendez-vous ',
                                    style: TextStyle(
                                        fontSize: 18,
                                       color: Color.fromARGB(255, 238, 238, 238),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Mentionner le jour, l\' heure et le lieu du Rdv. ',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 201, 201, 201),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                   color: Color.fromARGB(255, 42, 42, 42),
                    borderRadius: BorderRadius.circular(10)),
                child: CupertinoButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Post_cours_encadrement())),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Icon(CupertinoIcons.book_fill,
                              color: Colors.white, size: 25)),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publier une activité payante ',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 238, 238, 238),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        'Toucher plus de monde et gagner plus ! ',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 201, 201, 201),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 238, 238, 238),
                    borderRadius: BorderRadius.circular(10)),
                child: CupertinoButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => Page_poste_pense()))),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child:
                              Icon(Icons.public, color: Colors.red, size: 25)),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publier une pensée',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        'Partager vos convictions et expériences ! ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          
          ],
        ),
      ],
    );
  }

  Widget model_petit_ecran() {
    return ListView(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 42, 42, 42),
                    borderRadius: BorderRadius.circular(10)),
                child: CupertinoButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Poste_rendez_vous(
                    snap: widget.snap,
                  ))),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Icon(
                            CupertinoIcons.calendar_badge_plus,
                            color: Colors.white,
                            size: 25,
                          )),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publier un rendez-vous ',
                                    style: TextStyle(
                                        fontSize: 16,
                                       color: Color.fromARGB(255, 238, 238, 238),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Préciser le jour, l\' heure et le lieu du Rdv. ',
                                      style: TextStyle(
                                          color: Color.fromARGB(255, 201, 201, 201),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                   color: Color.fromARGB(255, 42, 42, 42),
                    borderRadius: BorderRadius.circular(10)),
                child: CupertinoButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Post_cours_encadrement())),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child: Icon(CupertinoIcons.book_fill,
                              color: Colors.white, size: 25)),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publier une activité payante',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 238, 238, 238),
                                        fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        'Toucher plus de monde et gagner plus ! ',
                                        style: TextStyle(
                                            color: Color.fromARGB(255, 201, 201, 201),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: CupertinoButton(
                  onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: ((context) => Page_poste_pense()))),
                  child: Row(
                    children: [
                      Flexible(
                          flex: 1,
                          child:
                              Icon(Icons.public, color: Colors.red, size: 25)),
                      SizedBox(
                        width: 15,
                      ),
                      Flexible(
                          flex: 4,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Publier une pensée ',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Text(
                                        'Partager vos convictions et expériences ! ',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            ),
          
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      
        backgroundColor: Color.fromARGB(255, 247, 247, 247),
        child: SafeArea(
          child: Column(
            children: [
              Flexible(child: Container(), flex: 1,),
              Flexible(
                flex: 4,
                child: Container(
                  height: 350,
                  child: Image.asset('assets/Icons/Mobile Marketing-pana.png'),
                ),
              ),
              Flexible(
                flex: 2,
                child: Center(
                  child: CupertinoButton( 
                    onPressed: () {
                      showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) {
                            return CupertinoPopupSurface(
                              isSurfacePainted: false,
                              child: Stack(
                                children: [
                                
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10),
                                    color: Color.fromARGB(255, 26, 26, 26),
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height > 800 ? 325 : 280,
                                    child: MediaQuery.of(context).size.width > 400
                                        ? model_grand_ecran()
                                        : model_petit_ecran(),
                                  ),
                            
                                Positioned(
                                  
                                  child: CupertinoButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                         MediaQuery.of(context).size.height > 800 ?
                                      Text('Fermer', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),):
                                      Text('')
                                    ],
                                  )))
                                
                                ],
                              ),
                            );
                          });
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.circular(10),
                        color: Colors.black,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Publier', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w300),)
                        ],
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
