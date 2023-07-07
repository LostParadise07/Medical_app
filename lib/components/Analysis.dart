import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:mentalapp/components/common/constant.dart';
import 'package:mentalapp/components/homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mentalapp/components/DepressionQuestionPage.dart';

class StartingPage extends StatelessWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(215, 215, 93, 243),
        shadowColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage()),
            );
          },
        ),
      ),
      body: FadeAnimation(
        duration: const Duration(milliseconds: 2000),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 209, 162, 247),
                Color.fromARGB(255, 248, 168, 248),
                Color.fromARGB(255, 212, 161, 251),
                Color.fromARGB(255, 173, 143, 190),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10.0,
              ),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      width: 300.0,
                      child: Image.asset(
                        'assets/images/Mental_analysis.jpg', // Replace with your image asset path
                        fit: BoxFit.cover,
                      ),
                    ),
                    _buildButton(
                      icon: FontAwesomeIcons.dna,
                      label: 'Personality Test',
                      color: backColor,
                      onPressed: () {
                        print('pressed ');
                      },
                    ),
                    const SizedBox(height: 1.0), // Adjust the gap here
                    _buildButton(
                      icon: FontAwesomeIcons.brain,
                      label: 'Anxiety Analysis',
                      color: backColor.withOpacity(0.5),
                      onPressed: () {
                        print('pressed');
                      },
                    ),
                    const SizedBox(height: 1.0), // Adjust the gap here
                    _buildButton(
                      icon: FontAwesomeIcons.userDoctor,
                      label: 'Depression Analysis',
                      color: backColor.withOpacity(0.5),
                      onPressed: () {
                        print('pressed');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DepressionQuestionWidget(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 2.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Expanded(
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0), // Adjust the vertical margin here
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        color: color,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(icon, color: Colors.white.withOpacity(0.8)),
                const SizedBox(width: 10.0),
                Flexible(
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
