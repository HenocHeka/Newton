import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:our_social_app/constantes/objet_constantes.dart';
import 'package:our_social_app/ecrans/intro_silder.dart';
import 'package:our_social_app/ecrans/page_connexion.dart';
import 'package:our_social_app/ecrans/page_incription.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';
import 'package:our_social_app/responsives/responsive_layaut.dart';
import 'package:our_social_app/responsives/web_home_ecran.dart';
import 'package:our_social_app/ressources/utilisateur_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBKpvcaAVllXxcXd460apnGENMlN2nTXPg",
        projectId: "backend-ubwakeme",
        storageBucket: "backend-ubwakeme.appspot.com",
        messagingSenderId: "960342258029",
        appId: "1:960342258029:web:beaa75396584e203ffea64"
          )
    );
  } else{
     await Firebase.initializeApp();
  }
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
           ChangeNotifierProvider(create: (_)=> UserProvider())
      ],
      child: MaterialApp( 
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
          home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder:(context, snapshot){
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData){
                  //return Page_Inscription();
                return Ecrans_responsive(
                  resolution_mobile: Mobile_home_ecran(),
                   resolution_web: Web_home_ecran());
              }else if(snapshot.hasError){
                return Center(
                  child: Text('${snapshot.error}'),
                );
              } 
      
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CupertinoActivityIndicator(
                  color: Colors.white),
              );
            }
            
            return Intro_Slider();
            // return Mobile_home_ecran();
            // return Page_Inscription();
          
          },
        )
       
      ),
    );
  }
}
