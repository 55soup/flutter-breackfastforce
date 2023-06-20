import 'package:breakfastforce/diary_write.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

final today = DateUtils.dateOnly(DateTime.now());

void main() {
  runApp(const Diary());
}

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CalendarDatePicker2 Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en', ''),
        Locale('zh', ''),
        Locale('he', ''),
        Locale('es', ''),
        Locale('ru', ''),
        Locale('ko', ''),
        Locale('hi', ''),
      ],
      home: MyHomePage(title: 'CalendarDatePicker2 Demo'),
      // home: Container(
      //   child: Column(
      //     children: [
      //       MyHomePage(title: 'title'),
      //     ],
      //   )
      // )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class ListItem {
  final String title;
  final String content;

  ListItem(this.title, this.content);
}

// 리스트 아이템을 표시하는 위젯
class CustomListItem extends StatelessWidget {
  final ListItem item;
  final int index;
  final List<Color> colors = [
    Color(0xFFFFFFFF),
    Color(0xFFFF9D7A),
    Color(0xFFFFEBE4),
    Color(0xFFFEE191),
  ];

  CustomListItem(this.item, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            width: 350, // 너비 조정
            decoration: BoxDecoration(
              color: colors[index % colors.length],
              borderRadius: BorderRadius.circular(20),
            ),
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.content,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<DateTime?> _dialogCalendarPickerValue = [
    DateTime(2021, 8, 10),
    DateTime(2021, 8, 13),
  ];
  List<DateTime?> _singleDatePickerValueWithDefaultValue = [
    DateTime.now(),
  ];
  List<DateTime?> _multiDatePickerValueWithDefaultValue = [
    DateTime(today.year, today.month, 1),
    DateTime(today.year, today.month, 5),
    DateTime(today.year, today.month, 14),
    DateTime(today.year, today.month, 17),
    DateTime(today.year, today.month, 25),
  ];
  List<DateTime?> _rangeDatePickerValueWithDefaultValue = [
    DateTime(1999, 5, 6),
    DateTime(1999, 5, 21),
  ];

  List<DateTime?> _rangeDatePickerWithActionButtonsWithValue = [
    DateTime.now(),
    DateTime.now().add(const Duration(days: 5)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 375,
          child: ListView(
            children: <Widget>[
              _buildDefaultMultiDatePickerWithValue(),
            ],
          ),
        ),
      ),
    );
  }

  String _getValueText(
      CalendarDatePicker2Type datePickerType,
      List<DateTime?> values,
      ) {
    values =
        values.map((e) => e != null ? DateUtils.dateOnly(e) : null).toList();
    var valueText = (values.isNotEmpty ? values[0] : null)
        .toString()
        .replaceAll('00:00:00.000', '');

    if (datePickerType == CalendarDatePicker2Type.multi) {
      valueText = values.isNotEmpty
          ? values
          .map((v) => v.toString().replaceAll('00:00:00.000', ''))
          .join(', ')
          : 'null';
    } else if (datePickerType == CalendarDatePicker2Type.range) {
      if (values.isNotEmpty) {
        final startDate = values[0].toString().replaceAll('00:00:00.000', '');
        final endDate = values.length > 1
            ? values[1].toString().replaceAll('00:00:00.000', '')
            : 'null';
        valueText = '$startDate to $endDate';
      } else {
        return 'null';
      }
    }

    return valueText;
  }

  // Listview datas
  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  // 사용 예시
  List<ListItem> itemList = [
    ListItem("제목 1", "내용 1"),
    ListItem("제목 2", "내용 2"),
    ListItem("제목 3", "내용 3"),
    ListItem("제목 3", "내용 3"),
    ListItem("제목 3", "내용 3"),
    ListItem("제목 3", "내용 3"),
  ];

Widget _buildDefaultMultiDatePickerWithValue() {
  final config = CalendarDatePicker2Config(
    calendarType: CalendarDatePicker2Type.multi,
    selectedDayHighlightColor: Color(0xffFFEBE4),
  );
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      const SizedBox(height: 10),
      CalendarDatePicker2(
        config: config,
        value: _multiDatePickerValueWithDefaultValue,
        onValueChanged: (dates) =>
            setState(() => _multiDatePickerValueWithDefaultValue = dates),
      ),
      const SizedBox(height: 10),
      Wrap(
          children: [
            const Text('Selection(s):  '),
            const SizedBox(width: 10),
            Text(
              _getValueText(
                config.calendarType,
                _multiDatePickerValueWithDefaultValue,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
            IconButton(
                icon: Icon(Icons.add_circle_outline),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) => DiaryWrite()));
                }
            ),
            const SizedBox(height: 50),
            Container(
              height: 400,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: const EdgeInsets.all(8),
                      itemCount: itemList.length,
                      itemBuilder: (context, index) {
                        return CustomListItem(itemList[index], index);
                      }, separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20),
                    ),
                  ),
                ],
              )
            ),
          ]
      )
    ]
  );
}


}