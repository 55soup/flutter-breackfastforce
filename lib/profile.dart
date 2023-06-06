import 'package:flutter/material.dart';
import 'dart:math';
import 'package:time_chart/time_chart.dart';

void main() => runApp(Profile());

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  // Data must be sorted.
  final smallDataList = [
    DateTimeRange(
      start: DateTime(2021, 2 , 24, 23, 15),
      end: DateTime(2021, 2, 25, 7, 30),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 22, 1, 55),
      end: DateTime(2021, 2, 22, 9, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 20, 0, 25),
      end: DateTime(2021, 2, 20, 7, 34),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 17, 21, 23),
      end: DateTime(2021, 2, 18, 4, 52),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 13, 6, 32),
      end: DateTime(2021, 2, 13, 13, 12),
    ),
    DateTimeRange(
      start: DateTime(2021, 2, 1, 9, 32),
      end: DateTime(2021, 2, 1, 15, 22),
    ),
    DateTimeRange(
      start: DateTime(2021, 1, 22, 12, 10),
      end: DateTime(2021, 1, 22, 16, 20),
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
        appBar: AppBar(title: const Text('Time chart example app')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Color(0xff90B661),
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20))
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
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
