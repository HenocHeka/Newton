import 'package:flutter/material.dart';


class Web_home_ecran extends StatefulWidget {
  const Web_home_ecran({ Key? key }) : super(key: key);

  @override
  State<Web_home_ecran> createState() => _Web_home_ecranState();
}

class _Web_home_ecranState extends State<Web_home_ecran> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('This is the web'),
      ),
      
    );
  }
}