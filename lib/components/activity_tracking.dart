import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
// import 'package:percent_indicator/percent_indicator.dart';
import 'package:mentalapp/components/homepage.dart';

class ActivityTrackingCard extends StatefulWidget {
  const ActivityTrackingCard({super.key});
  @override
  ActivityTrackingChartState createState() => ActivityTrackingChartState();
}

class ActivityTrackingChartState extends State<ActivityTrackingCard> {
  List<FlSpot> spots = [
    FlSpot(1, 60),
    FlSpot(2, 90),
    FlSpot(3.5, 102),
    FlSpot(4, 70),
    FlSpot(5, 80),
  ];

  var nav = true;
  var activityStatus = "Your Activity is Normal";
  var minActivity = 59, maxActivity = 82, avgActivity = 69;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 1, 1),
      appBar: nav
          ? AppBar(
              backgroundColor: Color.fromARGB(255, 72, 72, 72),
              shadowColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage()),
                  );
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    // handle favorite functionality
                  },
                ),
                PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 1,
                      child: Text('Option 1'),
                    ),
                    const PopupMenuItem(
                      value: 2,
                      child: Text('Option 2'),
                    ),
                    const PopupMenuItem(
                      value: 3,
                      child: Text('Option 3'),
                    ),
                  ],
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 25,
                  ),
                  onSelected: (value) {
                    // Handle selection of menu options here
                  },
                ),
              ],
            )
          : AppBar(
              backgroundColor: const Color.fromARGB(255, 72, 72, 72),
              shadowColor: Colors.transparent,
              leading: Container(),
            ),
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            setState(() {
              nav = !nav;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.89,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 108, 186, 249),
                    Color.fromARGB(255, 5, 84, 123),
                  ],
                  tileMode: TileMode.clamp),
            ),
          ),
        ),
      ),
    );
  }
}
