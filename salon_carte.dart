import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:our_social_app/ecrans/discussion.dart';
import 'package:our_social_app/modeles_cartes_poster/message_salon.dart';

class SalonCarte extends StatefulWidget {
  final snap;
  const SalonCarte({ Key? key, required this.snap }) : super(key: key);

  @override
  State<SalonCarte> createState() => _SalonCarteState();
}

class _SalonCarteState extends State<SalonCarte> {
  @override
  Widget build(BuildContext context) {
  
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
        child: Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white24,
              width: 0.5
            ),
              // color: Color.fromARGB(255, 14, 14, 14),
              borderRadius: BorderRadius.circular(8)),
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
                          child: Icon(CupertinoIcons.group_solid, color: Colors.white,size: 50,),
                        ),
                      ),
                      Container(),
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
                                      Text(
                                        widget.snap['nom_administrateur'].toString(),
                                        style: TextStyle(
                                            color: Colors.white54,
                                            fontWeight: FontWeight.bold),
                                      ),
                                        Text(
                                        ' a crée ce salon',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                 
                                  Text(
                                   '@'+widget.snap['description_administrateur'].toString(),
                                    style: TextStyle(color: Colors.white60),
                                  ),
                                   
                                ],
                              ),
                            ),
                          )),
                      SizedBox(width:MediaQuery.of(context).size.width > 630 ? 10:0),
                         Row(
                            children: [
                              Text(
                                   DateFormat.yM()
                          .format(widget.snap['tempPublication'].toDate()),
                                style: TextStyle(
                                  color: Colors.white,
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
                        onTap: (){
                          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>DiscussionSession(
                            snap: widget.snap,
                          )));
                        },
                        child: Container(
                         height: 110,
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(
                            color: Colors.blue,
                            width: 2
                            ),
                               
                               borderRadius: BorderRadius.circular(10)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:10.0,right: 13),
                                      child: Container(
                                          height: 65,
                                          width: 68,
                                          child: ClipOval(
                                            
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl: widget.snap['photoProfileAdmin'].toString(),
                                              placeholder: (context, url) => CupertinoActivityIndicator(color: Colors.white,),
                                             ),
                                          ),
                                        ),
                                    ),
                                   
                                    Container(
                                      width: 200,
                                      child: Column(
                                      children: [
                                        Text('Vous et 120 autres personnes',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),),
                                      ],
                                    ))
                                  ],
                                ),
                             
                              ],
                            ),
                          ),
                        ),
                      ),
                     
                    ],
                  ),
                  Column(
                   
                    children: [
                      Row(
                       
                        children: [
                          Row(
                            children: [
                                Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    CupertinoIcons.hand_thumbsup,
                                    color: Colors.white,
                                    size: 19,
                                  )),
                             
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0),
                            child: SizedBox(
                              width: 1,
                              child: Container(
                                color: Colors.white,
                                width: 2,
                                height: 20,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                          SizedBox(width: 5,),
                               Text(
                                'Nouveau Message',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5,),
                                Container(
                                  padding: EdgeInsets.all(2),
                                 
                                  decoration: BoxDecoration(
                                     color: Colors.red,
                                   borderRadius: BorderRadius.circular(4)

                                  ),
                                  child: Text('0') ,
                                ),
                            ],
                          ),
                      
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
        );
  
  }
}