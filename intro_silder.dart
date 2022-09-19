import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:our_social_app/ecrans/page_connexion.dart';
import 'package:our_social_app/ecrans/page_incription.dart';
import 'package:our_social_app/responsives/mobile_home_ercan.dart';

class Intro_Slider extends StatefulWidget {
  const Intro_Slider({Key? key}) : super(key: key);

  @override
  State<Intro_Slider> createState() => _Intro_SliderState();
}

class _Intro_SliderState extends State<Intro_Slider> {
  List<Slide> page_slider = [];

  @override
  void initState() {
    super.initState();
    page_slider.add(
      new Slide(
          title: ' Rendez-vous ',
          description:
              ' Organisez vos rendez-vous sans divulguer votre numéro de téléphone ! Ainsi garder vos numéros avec vos proches.  ',
          pathImage: 'assets/illustration/Confirmed attendance-amico.png'),
    );
    page_slider.add(
      new Slide(
          title: ' Conférences ',
          description:
              '  Avec Ubwakeme, organisez une conférence tout en sachant en avance le nombre de participant, la dépense et la recette  ! ',
          pathImage: 'assets/illustration/Conference-amico-2.png'),
    );
    page_slider.add(
      new Slide(
          title: ' Cours d\'encadrement ',
          description:
              ' Avez-vous une compétence particulière ? Ubwakeme vous aide à vendre vos services d\'enseignement en tant qu\'enseigant d\'université ou professionnel, et instructeur.',
          pathImage: 'assets/illustration/Classroom.png'),
    );
    page_slider.add(
      new Slide(
          title: ' Paiement en-ligne ',
          description:
              ' Avec la facilité que nous offre ubwakeme, Pas besoin de porter l\'argent sur vous. Payez où vous vous trouvez et quand vous voulez ! ',
          pathImage: 'assets/illustration/Mobile payments-cuate-3.png'),
    );
    page_slider.add(
      new Slide(
          title: ' Notifications ',
          description: '  Soyez notifié(e) en temps rêel ! ',
          pathImage: 'assets/illustration/Push notifications-pana.png'),
    );
  }

  List<Widget> mes_slider() {
    List<Widget> tabs = [];
    for (int i = 0; i < page_slider.length; i++) {
      Slide currentSlide = page_slider[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 160, top: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Image.asset(
                    currentSlide.pathImage!,
                    matchTextDirection: true,
                    height: 330,
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    currentSlide.title!,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    child: Text(
                      currentSlide.description!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w200),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }

    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: Color.fromARGB(255, 255, 255, 255),
      renderSkipBtn: Text('Passer', style: TextStyle(color: Colors.red)),
      renderNextBtn: Text('Suivant', style: TextStyle(color: Colors.red)),
      renderDoneBtn: Text(
        'C\'est Bon',
        style: TextStyle(color: Colors.red),
      ),
      renderPrevBtn: Text('Précédent', style: TextStyle(color: Colors.red)),
      onSkipPress: () => Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context)=> Page_connexion())),
      onDonePress: () => Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context)=> Page_connexion())),   
      colorDoneBtn: Colors.white,
      colorActiveDot: Colors.white,
      sizeDot: 8.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.mes_slider(),
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
    );
  }
}
