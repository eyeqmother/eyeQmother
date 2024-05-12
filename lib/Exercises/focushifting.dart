import 'package:flutter/material.dart';
import 'package:eyeqmother/resources/app_images.dart';

class Focusshifting extends StatefulWidget {
  @override
  State<Focusshifting> createState() => _FocusshiftingState();
}

class _FocusshiftingState extends State<Focusshifting> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Rectangle.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          width: 60,
                          height: 60,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/images/image2.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          'Exercises 9',
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Text(
                          'Do these ten exercises \n regularly to improve your eyesight',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Readex Pro',
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Die Eye Exercises',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: 'Readex Pro',
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'FocuscShifting Exercise',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '1). Sit comfortably: Find a comfortable chair and sit with your back straight.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '2). Relax: Close your eyes gently.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '3). Breathe: Take a deep breath in through your nose, and exhale slowly through your mouth.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '4). Open your eyes: Slowly open your eyes, but do not stare.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '5). Blink: Blink your eyes gently 10 times.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '6). Close your eyes: Close your eyes gently again.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '7). Repeat: Repeat this process for 3-5 times, or as needed.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'DIY Eye Massage',
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '1. Warm-Up:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• Rub your hands together vigorously until they feel warm.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Cup your hands over your closed eyes without applying pressure. Enjoy the warmth for about 30 seconds.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '2. Palming:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• Sit comfortably and close your eyes.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Place your palms over your eyes, with your fingers resting on your forehead.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Make sure there is no pressure on your eyeballs.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Breathe deeply and relax for 1-2 minutes.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '3. Focusshifting:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• Open your eyes and blink rapidly for about 20 seconds.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Then, close your eyes and relax for 20 seconds.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Repeat this 5 times.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '4. Eye Massage:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• With your eyes closed, use your index and middle fingers to gently massage your eyelids in a circular motion.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Start from the inner corner and move outwards.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Do this for about 30 seconds.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '5. Temple Massage:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• Use your fingertips to massage your temples in a circular motion for about 20 seconds.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '6. Forehead Massage:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• With your fingertips, massage your forehead in a circular motion, moving from the center outwards.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Focus on the area just above your eyebrows.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '• Continue for about 20 seconds.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      Text(
                        '7. Repeat:',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '• Repeat the entire process if desired, focusing on any areas that feel particularly tense.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Note: If you feel any discomfort or pain during the massage, stop immediately. It\'s essential to be gentle with your eyes and the surrounding area. If you\'re experiencing persistent eye problems, it\'s best to consult with an eye care professional.',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontFamily: 'Readex Pro',
                          letterSpacing: 0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
