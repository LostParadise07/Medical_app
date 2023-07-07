import 'package:flutter/material.dart';
import 'package:mentalapp/components/Quest.dart';
import 'package:mentalapp/components/activity_tracking.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'respiration.dart';
import 'package:mentalapp/components/widget_for_menu/navigation_drawer_widget.dart';

import 'package:mentalapp/components/set_reminders.dart';
import 'package:mentalapp/components/Analysis.dart';
import 'package:mentalapp/components/temprature.dart';
import 'package:mentalapp/components/hrv_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int questionsAnswered = 0;

  void updateQuestionsAnswered(int answered) {
    setState(() {
      questionsAnswered = answered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 93, 116, 231),
        drawer: const NavigationDrawerWidget(),
        body: Builder(builder: (context) {
          return Stack(
            children: [
              // App exit button starts here
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.width * 0.11,
                child: InkWell(
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.aspectRatio * 60,
                  ),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
              ),
              // App exit button ends here

              // Notification bell starts here
              Positioned(
                top: MediaQuery.of(context).size.height * 0.055,
                left: MediaQuery.of(context).size.width * 0.725,
                child: InkWell(
                  child: Icon(
                    Icons.notifications,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.aspectRatio * 60,
                  ),
                ),
              ),

              // Notification bell ends here

              //3 dots icon here
              Positioned(
                top: MediaQuery.of(context).size.height * 0.043,
                left: MediaQuery.of(context).size.width * 0.817,
                child: PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Set Reminders'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Addiction Tracking'),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('Option 3'),
                    ),
                  ],
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: MediaQuery.of(context).size.aspectRatio * 68,
                  ),
                  onSelected: (value) {
                    if (value == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SetRemindersMenu()),
                      );
                    }
                  },
                ),
              ),

              //3 dot icon ends here

              // Circle code starts here
              Positioned(
                top: MediaQuery.of(context).size.shortestSide * 0.196,
                left: MediaQuery.of(context).size.shortestSide * 0.254,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  child: CircularPercentIndicator(
                    radius: MediaQuery.of(context).size.shortestSide * 0.25,
                    lineWidth: MediaQuery.of(context).size.shortestSide * 0.09,
                    animation: true,
                    percent: questionsAnswered /
                        3, // Update percent with the number of questions answered
                    center: Text(
                      "Your Score",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: MediaQuery.of(context).size.aspectRatio * 28,
                        color: Colors.white,
                      ),
                    ),
                    backgroundColor: const Color.fromARGB(255, 3, 209, 72),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: const Color(0xFF1A1847),
                  ),
                ),
              ),
              //Circle code ends here

              // 6 Square Containers Start Here
              Container(
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.075,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.157,
                    top: MediaQuery.of(context).size.height * 0.55),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                //Container 1 Image
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StartingPage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/bpm.png',
                        fit: BoxFit.contain),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.10,
                    top: MediaQuery.of(context).size.height * 0.635),
                child: Text(
                  'Daily Checkup',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.aspectRatio * 27,
                  ),
                ),
              ),
              // Container 1 Text
              Container(
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.075,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.41,
                    top: MediaQuery.of(context).size.height * 0.55),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const TempCard()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/temp.png',
                        fit: BoxFit.contain),
                  ),
                ),
              ), // Container 2 Image
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.45,
                    top: MediaQuery.of(context).size.height * 0.635),
                child: Text(
                  'Temp',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 27),
                ),
              ), // Container 2 Text
              Container(
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.075,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.665,
                    top: MediaQuery.of(context).size.height * 0.55),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ActivityTrackingCard()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/activity.png',
                        fit: BoxFit.contain),
                  ),
                ),
              ), // Container 3 Image
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.69,
                    top: MediaQuery.of(context).size.height * 0.635),
                child: Text(
                  'Activity',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 27),
                ),
              ), // Container 3 Text
              Container(
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.075,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.16,
                    top: MediaQuery.of(context).size.height * 0.705),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RespCard()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/resp.png',
                        fit: BoxFit.contain),
                  ),
                ),
              ), // Container 4 Image
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.155,
                    top: MediaQuery.of(context).size.height * 0.794),
                child: Text(
                  'Respiration',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 27),
                ),
              ), // Container 4 Text
              Container(
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.075,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.415,
                    top: MediaQuery.of(context).size.height * 0.705),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HrvCard()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/hrv.png',
                        fit: BoxFit.contain),
                  ),
                ),
              ), //Container 5 Image
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.458,
                    top: MediaQuery.of(context).size.height * 0.792),
                child: Text(
                  'H.R.V',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 27),
                ),
              ), //Conatiner 5 Text
              Container(
                width: MediaQuery.of(context).size.width * 0.175,
                height: MediaQuery.of(context).size.height * 0.075,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.67,
                    top: MediaQuery.of(context).size.height * 0.704),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Image.asset('assets/images/zzz.png',
                        fit: BoxFit.contain),
                  ),
                ),
              ), // Container 6 Image
              Container(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.72,
                    top: MediaQuery.of(context).size.height * 0.79),
                child: Text(
                  'Sleep',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.aspectRatio * 27),
                ),
              ), //Container 6 Text
              // 6 Square Containers End Here

              // Navigation bar starts here
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.07,
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.07,
                    top: MediaQuery.of(context).size.height * 0.88,
                    right: MediaQuery.of(context).size.width * 0.07),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        child: const Column(
                          children: [
                            ImageIcon(AssetImage('assets/images/home.png')),
                            Text('Home'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        child: const Column(
                          children: [
                            ImageIcon(AssetImage('assets/images/cart.png')),
                            Text('My Cart'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        child: const Column(
                          children: [
                            ImageIcon(AssetImage('assets/images/bell.png')),
                            Text('My Mail'),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: GestureDetector(
                        child: const Column(
                          children: [
                            ImageIcon(AssetImage('assets/images/profile.png')),
                            Text('Profile'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Navigation bar ends here
            ],
          );
        }),
      ),
    );
  }
}
