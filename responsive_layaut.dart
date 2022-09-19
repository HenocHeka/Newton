import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:provider/provider.dart';

import '../ressources/utilisateur_provider.dart';

class Ecrans_responsive extends StatefulWidget {
  final Widget resolution_mobile;
  final Widget resolution_web;
  const Ecrans_responsive(
      {Key? key, required this.resolution_mobile, required this.resolution_web})
      : super(key: key);

  @override
  State<Ecrans_responsive> createState() => _Ecrans_responsiveState();
}

class _Ecrans_responsiveState extends State<Ecrans_responsive> {

@override
  void initState() {
    // TODO: implement initState
    super.initState();
      addData();
  }

addData() async{
  UserProvider _userProvider = Provider.of(context, listen: false);
  await _userProvider.refreshUser();
}

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((context, constraints) {
        if( constraints.maxWidth > resolution_max_web){
          return widget.resolution_web;
        } else{
          return widget.resolution_mobile;
        }
      }),
    );
  }
}
