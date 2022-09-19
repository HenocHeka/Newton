import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../modeles/modele_utilisateur.dart';
import '../ressources/utilisateur_provider.dart';

class MessageSalon extends StatefulWidget {
  final snap;
  const MessageSalon({Key? key, required this.snap}) : super(key: key);

  @override
  State<MessageSalon> createState() => _MessageSalonState();
}

class _MessageSalonState extends State<MessageSalon> {
  @override
  Widget build(BuildContext context) {
    Utilisateur? utilisateur = Provider.of<UserProvider>(context).getUser;
    return widget.snap['utilisateurId'] == '${utilisateur?.id_utlisateur}'
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
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
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [],
                                  ),
                                ),
                              )),
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
                                  color: widget.snap['utilisateurId'] ==
                                          '${utilisateur?.id_utlisateur}'
                                      ? Color.fromARGB(255, 203, 5, 71)
                                      : Color.fromARGB(255, 0, 115, 209),
                                  // border: Border.all(color: Colors.white12, width: 1),
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
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  widget.snap['message']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            DateFormat.yMMMd().format(widget
                                                .snap['tempPublication']
                                                .toDate()),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
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
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('0'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  CupertinoIcons.hand_thumbsup,
                                  color: Colors.white,
                                  size: 19,
                                )),
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
                  ),
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
                              child: Container(
                                height: 44,
                                width: 44,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        widget.snap['photoProfile'].toString(),
                                    placeholder: (context, url) =>
                                        CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              child: Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                color: widget.snap['utilisateurId'] ==
                                        '${utilisateur?.id_utlisateur}'
                                    ? Color.fromARGB(255, 203, 5, 71)
                                    : Color.fromARGB(255, 0, 115, 209),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ))
        : Padding(
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
                              child: Container(
                                height: 44,
                                width: 44,
                                child: ClipOval(
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        widget.snap['photoProfile'].toString(),
                                    placeholder: (context, url) =>
                                        CupertinoActivityIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              child: Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                color: widget.snap['utilisateurId'] ==
                                        '${utilisateur?.id_utlisateur}'
                                    ? Color.fromARGB(255, 203, 5, 71)
                                    : Color.fromARGB(255, 0, 115, 209),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Column(
                                              children: [
                                                Text(
                                                  widget.snap['nom_utilisateur']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white54,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 50,
                                          )
                                        ],
                                      ),
                                      Text(
                                        '@' +
                                            widget.snap['description']
                                                .toString(),
                                        style: TextStyle(color: Colors.white54),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 10,
                          ),
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
                                  color: widget.snap['utilisateurId'] ==
                                          '${utilisateur?.id_utlisateur}'
                                      ? Color.fromARGB(255, 203, 5, 71)
                                      : Color.fromARGB(255, 0, 115, 209),
                                  // border: Border.all(color: Colors.white12, width: 1),
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
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  widget.snap['message']
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Text(
                                            DateFormat.yMMMd().format(widget
                                                .snap['tempPublication']
                                                .toDate()),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
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
                            width: 200,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('0'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                                onTap: () {},
                                child: Icon(
                                  CupertinoIcons.hand_thumbsup,
                                  color: Colors.white,
                                  size: 19,
                                )),
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
            ));
  }
}
