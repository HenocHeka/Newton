import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/ecrans/page_notification.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';

class NotificationCarte extends StatefulWidget {
  const NotificationCarte({Key? key}) : super(key: key);

  @override
  State<NotificationCarte> createState() => _NotificationCarteState();
}

class _NotificationCarteState extends State<NotificationCarte> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 12, 17, 22),
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 12, 17, 22),
        elevation: 0,
      leading: IconButton(
        onPressed: (){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Mobile_home_ecran()));
        },
         icon: Icon(CupertinoIcons.arrow_left_circle, color: Colors.white,)),
        
       ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
            child: Container(
           
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.white12,
                  //   width: 0.5
                  // ),
                  // color: Color.fromARGB(255, 14, 14, 14),
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: 45,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                // border: Border.all(
                                //     color: Colors.blue, width: 2)
                              ),
                              child: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/logo/profile.jpg'),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -2,
                            right: -2,
                            child: Container(
                              child: Icon(Icons.calendar_month_outlined,color: Colors.blue,),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Henoc Kabengela  ',
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'a écrit sur le Rdv',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '@etudiant',
                                        style: TextStyle(color: Colors.white54),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                         SizedBox(width:MediaQuery.of(context).size.width > 630 ? 10:0),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:4.0),
                                child: Text(
                                  '6j',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.white12, width: 1),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 280,
                                              child: const Padding(
                                                padding: const EdgeInsets.all(
                                                    8.0),
                                                child: Text(
                                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Cras elementum ultrices diam. ',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                       Row(
                                         children: [
                                           Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              
                              Padding(
                                padding: const EdgeInsets.only(left:8.0, top: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.clock,
                                      color: Colors.white54,
                                      size: 16,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                              width: 210,
                                              child: Text(
                                                '08h30 à 12h30, Mardi 22-02-2022',
                                                style: TextStyle(
                                                    fontSize: 13, color: Colors.white54),
                                              )),
                                    )
                                  ],
                                ),
                                
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left:8.0, top: 2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.map_pin_ellipse,
                                      color: Colors.white54,
                                      size: 16,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Container(
                                             
                                                  width:260 ,
                                                      child: Text(
                                                         'UPC, Croisement Triomphale et 24 Novembre',
                                                        style: TextStyle(
                                                            fontSize: 13, color: Colors.white54),
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                
                              ),
                               Padding(
                                padding: const EdgeInsets.only(left:8.0, top: 2.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(
                                      CupertinoIcons.timer_fill,
                                      color: Colors.white54,
                                      size: 16,
                                    ),
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Container(
                                             
                                                  width:260 ,
                                                      child: Text(
                                                         'Environ 30 minutes ',
                                                        style: TextStyle(
                                                            fontSize: 13, color: Colors.white54),
                                                      )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                
                              ),
                             
                                
                              
                                 
                            
                            ],
                          ),
                                         ],
                                       ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 230,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  CupertinoIcons.delete_solid,
                                  color: Colors.white,
                                  size: 19,
                                )),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
