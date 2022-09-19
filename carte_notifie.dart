import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:our_social_app/modeles_cartes_poster/notification_message.dart';
import 'package:provider/provider.dart';

import '../modeles/modele_utilisateur.dart';
import '../ressources/reponse_acceptation.dart';
import '../ressources/utilisateur_provider.dart';

class NotifieCarte extends StatefulWidget {
  final snap;
  const NotifieCarte({Key? key, required this.snap}) : super(key: key);

  @override
  State<NotifieCarte> createState() => _NotifieCarteState();
}

class _NotifieCarteState extends State<NotifieCarte> {
  void effacerNotification() async {
    await AcceptationDemande()
        .EffacerNotification(widget.snap['accepteId'].toString());
  }

  void effacerNotificatio() async {
    await AcceptationDemande()
        .EffacerNotification(widget.snap['refuseId'].toString());
  }

  Future EffacerPub() async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Attention'),
            content: Text(
                'La notification sera définitivement supprimée, Supprimer ?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () async {
                  effacerNotification();
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

  Future Effacer() async {
    await showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text('Attention'),
            content: Text(
                'La notification sera définitivement supprimée, Supprimer ?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () async {
                  effacerNotificatio();
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

    return widget.snap['id_destinateur'] == '${utilisateur?.id_utlisateur}'
        ? widget.snap['typeNotification'] == 'refus'
            ? Padding(
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
                                        imageUrl: widget.snap['photoProfile']
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
                              Positioned(
                                bottom: 5,
                                right: 6,
                                child: Container(
                                  child: Icon(
                                    CupertinoIcons.calendar_badge_minus,
                                    color: Colors.red,
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                width: 140,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      widget.snap[
                                                              'nom_utilisateur']
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Text(
                                                ' a refusé le Rdv',
                                                style: TextStyle(
                                                    color: Colors.white54,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '@' +
                                                widget.snap['description']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Colors.white54),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              Row(
                                children: [],
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat.yMd().format(
                                    widget.snap['tempPublication'].toDate()),
                                style: TextStyle(
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width > 630
                                      ? 40
                                      : 20),
                              Text(
                                'Demande refusée',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(255, 165, 34, 24)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35.0),
                                child: GestureDetector(
                                    onTap: Effacer,
                                    child: Icon(
                                      CupertinoIcons.delete_solid,
                                      color: Colors.white70,
                                      size: 19,
                                    )),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 6.0),
                            child: Container(
                              width: 273,
                              height: 1,
                              color: Colors.white24,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ))
            : ExpansionTile(
                title: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                    child: Container(
                      width: 500,
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
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: Container(
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
                                            imageUrl: widget
                                                .snap['photoProfile']
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
                                ],
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      widget.snap['nom_utilisateur'].toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '@' + widget.snap['description'].toString(),
                                style: TextStyle(color: Colors.white54),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      ' a accepté votre demande',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 15.0),
                                child: Container(
                                  width: 180,
                                  height: 1,
                                  color: Colors.white24,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Text(
                                  DateFormat.yMd().format(
                                      widget.snap['tempPublication'].toDate()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w200,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )),
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 6),
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
                                              imageUrl: widget
                                                  .snap['photoProfile']
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
                                    Positioned(
                                      bottom: -2,
                                      right: -2,
                                      child: Container(
                                        child: Icon(
                                          Icons.calendar_month_outlined,
                                          color: Colors.blue,
                                        ),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      child: Column(
                                                        children: [
                                                          Text(
                                                            widget.snap[
                                                                    'nom_utilisateur']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white54,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Text(
                                                      ' a écrit sur le Rdv',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  '@' +
                                                      widget.snap['description']
                                                          .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white54),
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width >
                                                    630
                                                ? 10
                                                : 0),
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
                                            border: Border.all(
                                                color: Colors.white12,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                children: [
                                                  Column(
                                                    children: [
                                                      Container(
                                                        width: 280,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            widget.snap[
                                                                    'descriptio_rendez_vous']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
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
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 8.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .clock,
                                                              color: Colors
                                                                  .white54,
                                                              size: 16,
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(3.0),
                                                              child: Container(
                                                                  width: 210,
                                                                  child: Text(
                                                                    widget
                                                                            .snap[
                                                                                'heureDebutReception']
                                                                            .toString() +
                                                                        ' à ' +
                                                                        widget
                                                                            .snap[
                                                                                'heureFinReception']
                                                                            .toString() +
                                                                        ', ' +
                                                                        DateFormat.yMd().format(widget
                                                                            .snap['tempPublication']
                                                                            .toDate()),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            13,
                                                                        color: Colors
                                                                            .white54),
                                                                  )),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 2.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .map_pin_ellipse,
                                                              color: Colors
                                                                  .white54,
                                                              size: 16,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              3.0),
                                                                      child: Container(
                                                                          width: 260,
                                                                          child: Text(
                                                                            widget.snap['lieu'].toString(),
                                                                            style:
                                                                                TextStyle(fontSize: 13, color: Colors.white54),
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
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                left: 8.0,
                                                                top: 2.0),
                                                        child: Row(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Icon(
                                                              CupertinoIcons
                                                                  .timer_fill,
                                                              color: Colors
                                                                  .white54,
                                                              size: 16,
                                                            ),
                                                            Row(
                                                              children: [
                                                                Column(
                                                                  children: [
                                                                    Padding(
                                                                      padding:
                                                                          const EdgeInsets.all(
                                                                              3.0),
                                                                      child: Container(
                                                                          width: 260,
                                                                          child: Text(
                                                                            widget.snap['tempEntretien'].toString(),
                                                                            style:
                                                                                TextStyle(fontSize: 13, color: Colors.white54),
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
                                          onTap: EffacerPub,
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
                ],
              )
        : Container();
  }
}
