import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/constants/colors.dart';
import 'package:flutter_quiz_app/constants/icons.dart';
import 'package:google_fonts/google_fonts.dart';

class Widget1 extends StatelessWidget {
  const Widget1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Pallete.toBoardingScreen1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImage.onBording1,
            height: 300,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Embark on a quest for wisdom with our Quiz app\'s.Answer intriguing questions and unlock new realms of knowledge ',
              style: GoogleFonts.nunito(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Knowledge Quest:\nExpand Your Mind Level!',
            style: GoogleFonts.catamaran(
                fontSize: 25, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          Text(
            '1/3',
            style: GoogleFonts.catamaran(
                fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class Widget2 extends StatelessWidget {
  const Widget2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Pallete.toBoardingScreen2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImage.onBording2,
            height: 300,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Dive into a world of discovery. Explore fascinating information and unearth hidden treasures of wisdom. Begin your trivia odyssey now!',
              style: GoogleFonts.nunito(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Trivia Odyssey:\nDiscover New Depths!',
            style: GoogleFonts.catamaran(
                fontSize: 25, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          Text(
            '2/3',
            style: GoogleFonts.catamaran(
                fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class Widget3 extends StatelessWidget {
  const Widget3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      color: Pallete.toBoardingScreen3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImage.onBording3,
            height: 300,
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Get ready for mind-bending Questions. Unravel the enigma of trivia, piece by piece. Enter the realm of Mind Mazes!',
              style: GoogleFonts.nunito(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w300,
                  color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
          ),
          Text(
            'Mind Mazes:\nSolve the Enigma!',
            style: GoogleFonts.catamaran(
                fontSize: 25, fontWeight: FontWeight.w900),
            textAlign: TextAlign.center,
          ),
          Text(
            '3/3',
            style: GoogleFonts.catamaran(
                fontSize: 15.0, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}
