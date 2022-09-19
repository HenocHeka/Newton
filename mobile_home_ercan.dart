import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/ecrans/page_de_poste.dart';
import 'package:our_social_app/ecrans/page_profile.dart';
import 'package:our_social_app/ecrans/page_recherche.dart';
import 'package:our_social_app/ecrans/poste_cours_encadrement.dart';
import 'package:our_social_app/ecrans/poste_pens%C3%A9e.dart';
import 'package:our_social_app/ecrans/poste_rendez_vous.dart';

class Mobile_home_ecran extends StatefulWidget {
  const Mobile_home_ecran({Key? key}) : super(key: key);

  @override
  State<Mobile_home_ecran> createState() => _Mobile_home_ecranState();
}

class _Mobile_home_ecranState extends State<Mobile_home_ecran> {
  PageController _pageController = PageController();
  int actuelle_page = 0;

Future Boite_publication() async{
  await showDialog(
   
    context: context,
     builder: (context){
      return SimpleDialog(
        title: Text('Publier ', style: TextStyle(color: Colors.white,  ), ),
      
          children: [
              
               SimpleDialogOption(
                padding: EdgeInsets.all(10),
                onPressed: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Post_cours_encadrement()));
                },
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(child: Text('Séance de Cours',style: TextStyle(fontWeight: FontWeight.bold))),
                ),
                
                
              ),
               SimpleDialogOption(
                 padding: EdgeInsets.all(10),
                onPressed: (){
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Page_poste_pense()));
                },
                child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: Text('Poste ',style: TextStyle(fontWeight: FontWeight.bold))),
                ),
               
                
              ),
               SimpleDialogOption(
                 padding: EdgeInsets.all(10),
                onPressed: (){
                   Navigator.of(context).pop();
                },
                child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    child: Text('Annuler', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),)),
                ),
               
                
              )
          ],
      );
     });
}





  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  void Page_de_navigation(int page) {
    _pageController.jumpToPage(page);
  }

  void Changer_Page_indexe(int page) {
    setState(() {
      actuelle_page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 233, 233),
       
        body: PageView(
          physics: NeverScrollableScrollPhysics() ,
          controller: _pageController,
          children: les_fenetres_accueil,
          onPageChanged: Changer_Page_indexe,
        ),
        bottomNavigationBar: CupertinoTabBar(
          border : Border(top: BorderSide(color: Colors.white24, width: 0.4)),
             backgroundColor: Color.fromARGB(255, 10, 15, 19),
            onTap: Page_de_navigation,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.home,
                  color: actuelle_page == 0 ? Colors.white : Colors.white38,
                ),
              ),
              BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      Icon(
                        CupertinoIcons.calendar_badge_plus,
                        color:
                            actuelle_page == 1 ?  Colors.white : Colors.white38,
                      ),
                      // Positioned(
                      //     top: 2,
                      //     right: 1,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.red, shape: BoxShape.circle),
                      //       width: 8,
                      //       height: 9,
                      //     ))
                    ],
                  ),
                 ),
                 BottomNavigationBarItem(
                  icon: Icon(
                        CupertinoIcons.person_2_alt,
                        color:
                            actuelle_page == 2 ?  Colors.white : Colors.white38,
                      ),
                 ),
             
              BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      Icon(
                        CupertinoIcons.chat_bubble_2_fill,
                        color:
                            actuelle_page == 3 ?  Colors.white : Colors.white38,
                      ),
                      // Positioned(
                      //     top: 2,
                      //     right: 1,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.red, shape: BoxShape.circle),
                      //       width: 8,
                      //       height: 9,
                      //     ))
                    ],
                  ),
                 ),
              BottomNavigationBarItem(
                  icon: Stack(
                    children: [
                      Icon(
                        Icons.notifications,
                        color:
                            actuelle_page == 4 ?  Colors.white : Colors.white38,
                      ),
                      // Positioned(
                      //     top: 2,
                      //     right: 1,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.red, shape: BoxShape.circle),
                      //       width: 8,
                      //       height: 9,
                      //     ))
                    ],
                  ),
                 ),
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 26, 26, 26),
          elevation: 0,
          heroTag: null,
          onPressed: () => Boite_publication(),
          // Navigator.of(context)
          //     .push(CupertinoPageRoute(builder: (context) => Page_de_Poste())),
          splashColor: Colors.black,
          child: Icon(
            CupertinoIcons.paperplane_fill,
            color: Colors.blue,size: 30,
          ),
        ));
  }
}
