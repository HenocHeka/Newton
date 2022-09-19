import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:our_social_app/modeles/modele_utilisateur.dart';
import 'package:provider/provider.dart';

import '../ressources/utilisateur_provider.dart';

class Poste_Carte extends StatefulWidget {
  final snap;
  const Poste_Carte({Key? key, required this.snap}) : super(key: key);

  @override
  State<Poste_Carte> createState() => _Poste_CarteState();
}

class _Poste_CarteState extends State<Poste_Carte> {
  Future EffacerPub() async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Attention'),
            content: Text(
                'La publication ne sera pas totalement supprimée mais cachée, Voulez-vous faire membre ?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Oui'),
                isDestructiveAction: false,
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Non'),
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }

  Future inscrireInfo() async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Attention'),
            content:
                Text('Ce cours a un salon pour tous les inscris, Participer ?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () async {
                  Navigator.of(context).pop();
                },
                child: Text('Oui'),
                isDestructiveAction: false,
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Non'),
                isDestructiveAction: true,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Utilisateur? utilisateur = Provider.of<UserProvider>(context).getUser;
    return widget.snap['typePoste'] == 'cours'
        ? widget.snap['photoPublier'] == ''
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
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
                                    height: 45,
                                    width: 55,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: widget.snap['photo_profil']
                                            .toString(),
                                        placeholder: (context, url) =>
                                            CupertinoActivityIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
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
                                          Text(
                                            widget.snap['nom_utlisateur']
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '@' +
                                                widget.snap[
                                                        'descriptionUtilisateur']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white54),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: 50,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child:widget.snap['id_utlisateur'] == '${utilisateur?.id_utlisateur}' ?Container(): GestureDetector(
                                      onTap: () async {
                                        inscrireInfo();
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromARGB(26, 109, 255, 96),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                        child: Row(
                                          children: [
                                            Text('S\'inscrire',
                                                style: TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 73, 219, 75),
                                                    fontWeight: FontWeight.bold))
                                          ],
                                        ),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.auto_stories_sharp,
                                    color: Colors.white70,
                                    size: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        width: 280,
                                        child: Text(
                                          widget.snap['nomcours'].toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    widget.snap['descriptio_postes'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  widget.snap['mode'] == 'Payant'
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.mobile_friendly,
                                              color: Colors.white54,
                                              size: 16,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                widget.snap['montant']
                                                        .toString() +
                                                    ' CDF',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white54),
                                              ),
                                            )
                                          ],
                                        )
                                      : Container(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            width: 280,
                                            child: Text(
                                              widget.snap['heureDebut']
                                                      .toString() +
                                                  ' à ' +
                                                  widget.snap['heureFin']
                                                      .toString() +
                                                  ', ' +
                                                  DateFormat.yMMMd().format(
                                                      widget.snap['dateCours']
                                                          .toDate()),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white54),
                                            )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        CupertinoIcons.map_pin_ellipse,
                                        color: Colors.white54,
                                        size: 16,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                            width: 280,
                                            child: Text(
                                              widget.snap['lieu'].toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white54),
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.group_solid,
                                          color: Colors.blue,
                                          size: 26,
                                        ),
                                        Text(
                                          ' 0',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.hand_thumbsup_fill,
                                          color: Colors.blue,
                                          size: 13,
                                        ),
                                        Text(
                                          ' 0',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons
                                            .bubble_left_bubble_right_fill,
                                        color: Colors.blue,
                                        size: 13,
                                      ),
                                      Text(
                                        ' 0',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 630
                                            ? 70
                                            : 30,
                                  ),
                                  Text(
                                    widget.snap['mode'].toString(),
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 630
                                            ? 15
                                            : 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat.yMMMd().format(widget
                                            .snap['tempPublication']
                                            .toDate()),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons.hand_thumbsup,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Aimer',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons
                                                .bubble_left_bubble_right,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Commenter',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      )
                                    ],
                                  ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       CupertinoIcons.plus_bubble_fill,
                                  //       color: Colors.white,
                                  //       size: 19,
                                  //     )),
                                  GestureDetector(
                                      onTap: () => EffacerPub(),
                                      child: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: Colors.white,
                                        size: 19,
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
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
                                    height: 45,
                                    width: 55,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: widget.snap['photo_profil']
                                            .toString(),
                                        placeholder: (context, url) =>
                                            CupertinoActivityIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            widget.snap['nom_utlisateur']
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '@' +
                                                widget.snap[
                                                        'descriptionUtilisateur']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white54),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: 50,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: widget.snap['id_utlisateur'] ==
                                            '${utilisateur?.id_utlisateur}'
                                        ? Container()
                                        : GestureDetector(
                                            onTap: () async {
                                              inscrireInfo();
                                            },
                                            child: Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      26, 109, 255, 96),
                                                  borderRadius:
                                                      BorderRadius.circular(7)),
                                              child: Row(
                                                children: [
                                                  Text('S\'inscrire',
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255, 73, 219, 75),
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.auto_stories_sharp,
                                    color: Colors.white70,
                                    size: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                        width: 280,
                                        child: Text(
                                          widget.snap['nomcours'].toString(),
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white70),
                                        )),
                                  )
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    widget.snap['descriptio_postes'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, right: 2),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  height: 175,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          CupertinoActivityIndicator(
                                            color: Colors.white,
                                          ),
                                      imageUrl: widget.snap['photoPublier']
                                          .toString()),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  widget.snap['mode'] == 'Payant'
                                      ? Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.mobile_friendly,
                                              color: Colors.white54,
                                              size: 16,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Text(
                                                widget.snap['montant']
                                                        .toString() +
                                                    ' CDF',
                                                style: TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white54),
                                              ),
                                            )
                                          ],
                                        )
                                      : Container(),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            width: 280,
                                            child: Text(
                                              widget.snap['heureDebut']
                                                      .toString() +
                                                  ' à ' +
                                                  widget.snap['heureFin']
                                                      .toString() +
                                                  ', ' +
                                                  DateFormat.yMMMd().format(
                                                      widget.snap['dateCours']
                                                          .toDate()),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white54),
                                            )),
                                      )
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        CupertinoIcons.map_pin_ellipse,
                                        color: Colors.white54,
                                        size: 16,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Container(
                                            width: 280,
                                            child: Text(
                                              widget.snap['lieu'].toString(),
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white54),
                                            )),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.group_solid,
                                          color: Colors.blue,
                                          size: 26,
                                        ),
                                        Text(
                                          ' 0',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.hand_thumbsup_fill,
                                          color: Colors.blue,
                                          size: 13,
                                        ),
                                        Text(
                                          ' 0',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons
                                            .bubble_left_bubble_right_fill,
                                        color: Colors.blue,
                                        size: 13,
                                      ),
                                      Text(
                                        ' 0',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 630
                                            ? 70
                                            : 30,
                                  ),
                                  Text(
                                    widget.snap['mode'].toString(),
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 630
                                            ? 15
                                            : 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat.yMMMd().format(widget
                                            .snap['tempPublication']
                                            .toDate()),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons.hand_thumbsup,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Aimer',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons
                                                .bubble_left_bubble_right,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Commenter',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      )
                                    ],
                                  ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       CupertinoIcons.plus_bubble_fill,
                                  //       color: Colors.white,
                                  //       size: 19,
                                  //     )),
                                  GestureDetector(
                                      onTap: () => EffacerPub(),
                                      child: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: Colors.white,
                                        size: 19,
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
        : widget.snap['photoPublier'] == ''
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
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
                                    height: 45,
                                    width: 55,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: widget.snap['photo_profil']
                                            .toString(),
                                        placeholder: (context, url) =>
                                            CupertinoActivityIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
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
                                          Text(
                                            widget.snap['nom_utlisateur']
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '@' +
                                                widget.snap[
                                                        'descriptionUtilisateur']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white54),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: 50,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(26, 96, 183, 255),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Row(
                                      children: [
                                        Text('S\'abonner',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 73, 173, 255),
                                                fontWeight: FontWeight.bold))
                                      ],
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
                              Container(
                                width: 300,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Text(
                                    widget.snap['descriptio_postes'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.hand_thumbsup_fill,
                                        color: Colors.blue,
                                        size: 13,
                                      ),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons
                                            .bubble_left_bubble_right_fill,
                                        color: Colors.blue,
                                        size: 13,
                                      ),
                                      Text(
                                        ' 0',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 630
                                            ? 180
                                            : 125,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat.yMMMd().format(widget
                                            .snap['tempPublication']
                                            .toDate()),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons.hand_thumbsup,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Aimer',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons
                                                .bubble_left_bubble_right,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Commenter',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      )
                                    ],
                                  ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       CupertinoIcons.plus_bubble_fill,
                                  //       color: Colors.white,
                                  //       size: 19,
                                  //     )),
                                  GestureDetector(
                                      onTap: () => EffacerPub(),
                                      child: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: Colors.white,
                                        size: 19,
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ))
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white12),
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
                                    height: 45,
                                    width: 55,
                                    child: ClipOval(
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl: widget.snap['photo_profil']
                                            .toString(),
                                        placeholder: (context, url) =>
                                            CupertinoActivityIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
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
                                          Text(
                                            widget.snap['nom_utlisateur']
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            '@' +
                                                widget.snap[
                                                        'descriptionUtilisateur']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white54),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              SizedBox(
                                width: 50,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(26, 96, 183, 255),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Row(
                                      children: [
                                        Text('S\'abonner',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 73, 173, 255),
                                                fontWeight: FontWeight.bold))
                                      ],
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
                              Container(
                                width: MediaQuery.of(context).size.width - 80,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4, bottom: 8.0),
                                  child: Text(
                                    widget.snap['descriptio_postes'].toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 10, right: 2),
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 80,
                                  height: 175,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10)),
                                  child: CachedNetworkImage(
                                      placeholder: (context, url) =>
                                          CupertinoActivityIndicator(
                                            color: Colors.white,
                                          ),
                                      imageUrl: widget.snap['photoPublier']
                                          .toString()),
                                ),
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons.hand_thumbsup_fill,
                                        color: Colors.blue,
                                        size: 13,
                                      ),
                                      Text(
                                        '0',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 13,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        CupertinoIcons
                                            .bubble_left_bubble_right_fill,
                                        color: Colors.blue,
                                        size: 13,
                                      ),
                                      Text(
                                        ' 0',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width > 630
                                            ? 180
                                            : 100,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        DateFormat.yMMMd().format(widget
                                            .snap['tempPublication']
                                            .toDate()),
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons.hand_thumbsup,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Aimer',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            CupertinoIcons
                                                .bubble_left_bubble_right,
                                            color: Colors.white,
                                            size: 19,
                                          )),
                                      Text(
                                        'Commenter',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8,
                                      )
                                    ],
                                  ),
                                  // IconButton(
                                  //     onPressed: () {},
                                  //     icon: Icon(
                                  //       CupertinoIcons.plus_bubble_fill,
                                  //       color: Colors.white,
                                  //       size: 19,
                                  //     )),
                                  GestureDetector(
                                      onTap: () => EffacerPub(),
                                      child: Icon(
                                        CupertinoIcons.delete_solid,
                                        color: Colors.white,
                                        size: 19,
                                      ))
                                ],
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ));
    //
  }
}
