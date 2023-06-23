import 'package:flutter/material.dart';
import 'dart:math';
import 'package:time_chart/time_chart.dart';


void main() => runApp(Profile());

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  // Data must be sorted.
  final smallDataList = [
    DateTimeRange(
      start: DateTime(2023, 6 , 15, 23, 15),
      end: DateTime(2023, 6, 16, 7, 30),
    ),
    DateTimeRange(
      start: DateTime(2023, 6, 14, 1, 55),
      end: DateTime(2023, 6, 15, 9, 12),
    ),
    DateTimeRange(
      start: DateTime(2023, 6, 14, 0, 25),
      end: DateTime(2023, 6, 14, 7, 34),
    ),
    DateTimeRange(
      start: DateTime(2023, 6, 12, 21, 23),
      end: DateTime(2023, 6, 13, 4, 52),
    ),
    DateTimeRange(
      start: DateTime(2023, 6, 12, 6, 32),
      end: DateTime(2023, 6, 12, 13, 12),
    ),
    DateTimeRange(
      start: DateTime(2023, 6, 11, 12, 32),
      end: DateTime(2023, 6, 12, 7, 22),
    ),
    DateTimeRange(
      start: DateTime(2023, 6, 10, 1, 10),
      end: DateTime(2023, 6, 10, 10, 20),
    ),
  ];

  List<DateTimeRange> getRandomSampleDataList() {
    final List<DateTimeRange> list = [];
    final random = Random();

    for (int i = 0; i < 10000; ++i) {
      final int randomMinutes1 = random.nextInt(59);
      final int randomMinutes2 = random.nextInt(59);
      final start = DateTime(2021, 2, 1 - i, 0, randomMinutes1);
      final end = DateTime(2021, 2, 1 - i, 7, randomMinutes2 + randomMinutes1);

      list.add(DateTimeRange(
        start: start,
        end: end,
      ));
    }
    return list;
  }

  late final List<DateTimeRange> bigDataList = getRandomSampleDataList();

  @override
  Widget build(BuildContext context) {
    const sizedBox = SizedBox(height: 16);
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                // fit: BoxFit,
                image: AssetImage('images/profile/profileBackground.png'),
              )
            ),
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('images/recipe/recipe1.png')
                      )
                    ),
                  ),
                  Text("선주팍",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
                  ),
                  Text("좋은 아침입니다~"),
                  Text("평균 6시간 16분 자네요!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   Container(
                       width: 180,
                       height: 80,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.circular(20),
                           boxShadow: [
                             BoxShadow(
                               color: Colors.grey.withOpacity(0.2),
                               blurRadius: 5.0,
                               spreadRadius: 0.0,
                               // offset: const Offset(0,7),
                             )
                           ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.wb_sunny_outlined, size: 30),
                           Text("6:30",
                             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                           )
                         ],
                       )
                   ),
                   SizedBox(width: 20),
                   Container(
                       width: 180,
                       height: 80,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: Colors.black87,
                         borderRadius: BorderRadius.circular(20),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.grey.withOpacity(0.2),
                             blurRadius: 5.0,
                             spreadRadius: 0.0,
                             // offset: const Offset(0,7),
                           )
                         ],
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.shield_moon_outlined, size: 30, color: Colors.white),
                           Text("12:30",
                             style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                           )
                         ],
                       )
                   ),
                 ],
               ),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                  // const Text('Weekly time chart'),
                  TimeChart(
                    data: smallDataList,
                    viewMode: ViewMode.weekly,
                  ),
                ),
                // const Text('Weekly amount chart'),
                // TimeChart(
                //   data: smallDataList,
                //   chartType: ChartType.amount,
                //   viewMode: ViewMode.weekly,
                //   barColor: Colors.deepPurple,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WakeNight extends StatelessWidget {
const WakeNight({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
          width: 180,
          height: 80,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5.0,
                spreadRadius: 0.0,
                // offset: const Offset(0,7),
              )
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shield_moon_outlined, size: 30, color: Colors.white),
              Text("12:30",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          )
      ),
    );
  }
}
