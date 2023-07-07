import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'homepage.dart';

class HrvCard extends StatefulWidget {
  const HrvCard({super.key});

  @override
  HrvChartState createState() => HrvChartState();
}

class HrvChartState extends State<HrvCard> {
  List<FlSpot> spots = [
    FlSpot(1, 75),
    FlSpot(2, 59),
    FlSpot(3.5, 73),
    FlSpot(4, 78),
    FlSpot(5, 80),
  ];
  var nav = true;
  var hrvStatus = "Your HRV is Normal";
  var minHrv = 59, maxHrv = 82, avgHrv = 69;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 35, 1, 1),
      appBar: nav
          ? AppBar(
              backgroundColor: const Color.fromARGB(255, 72, 72, 72),
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

// minimun , maximun and average hrv
class _Rw extends StatelessWidget {
  var txt;
  var t; // Top Margin
  var hrv; //  Heart Rate Variability

  _Rw(s, this.t, this.hrv) {
    txt = s;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      margin: EdgeInsets.only(top: t, left: 15, right: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          "${txt}HRV",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: LinearPercentIndicator(
            animateFromLastPercent: true,
            animationDuration: 100,
            width: MediaQuery.of(context).size.width * 0.3,
            lineHeight: 18.0,
            percent: hrv / 130,
            barRadius: const Radius.circular(16),
            center: Text(
              "$hrv",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),

            // linearStrokeCap: LinearStrokeCap.roundAll,
            backgroundColor: Colors.blueGrey,
            progressColor: Colors.blue,
          ),
        ),
      ]),
    );
  }
}
