import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '설문조사 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SurveyPage(),
        '/second': (context) => SecondPage(),
      },
    );
  }
}

class SurveyPage extends StatefulWidget {
  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  String name = '';

  void _navigateToSecondPage() {
    Navigator.pushNamed(context, '/second');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('설문조사 페이지'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 300,
                  child: Text(
                    '이름을',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(height: 8),
                Container(
                  width: 100,
                  child: Text(
                    '작성해주세요',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _navigateToSecondPage, // 완료 버튼 클릭 시 두 번째 페이지로 이동
                        child: Text('완료'),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('첫 번째 질문'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              child: Text(
                '오늘 아침식사를',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 300,
              child: Text(
                '하셨나요?',
                style: TextStyle(fontSize: 33),
              ),
            ),
            SizedBox(height: 16),
            Container(
                width:300,
                child: Padding(
                  padding: EdgeInsets.all(50.0),
                  child:Image.asset('soo/q1.png'),
                )
            ),
            Container(
              width:300,
              child :
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                  // 두 번째 페이지의 "네" 버튼 동작 구현
                },
                child: Text('네'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),

            ),

            SizedBox(height: 8),
            Container(
              width:300,
              child :
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdPage()),
                  );
                  // 두 번째 페이지의 "아니오" 버튼 동작 구현
                },
                child: Text('아니오'),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  List<String> selectedReasons = [];

  void toggleReason(String reason) {
    setState(() {
      if (selectedReasons.contains(reason)) {
        selectedReasons.remove(reason);
      } else {
        selectedReasons.add(reason);
      }
    });
  }

  void _navigateToFourthPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FourthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('두 번째 질문'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              child: Text(
                '아침식사를 거르는',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 300,
              child: Text(
                '이유는 무엇인가요?',
                style: TextStyle(fontSize: 33),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Image.asset('soo/q2.png'),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleReason('시간부족');
              },
              child: Text('시간부족'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary: selectedReasons.contains('시간부족')
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleReason('식욕부진');
              },
              child: Text('식욕부진'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary: selectedReasons.contains('식욕부진')
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleReason('게으름');
              },
              child: Text('게으름'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedReasons.contains('게으름') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleReason('소화문제');
              },
              child: Text('소화문제'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedReasons.contains('소화문제') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FourthPage()),
                );
              },
              child: Container(
                width: 100,
                height:40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Text(
                    '해당 사항 없음',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _navigateToFourthPage, // Navigate to FourthPage
              child: Text('완료'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  Set<String> selectedOptions = {};

  void toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  void navigateToFifthPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FifthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('세 번째 질문'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              child: Text(
                '이상적인 아침식사는',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 300,
              child: Text(
                '무엇인가요?',
                style: TextStyle(fontSize: 33),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Image.asset('soo/q3.png'),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('빵 또는 떡류');
              },
              child: Text('빵 또는 떡류'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary: selectedOptions.contains('빵 또는 떡류')
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('한식');
              },
              child: Text('한식'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('한식') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('과일');
              },
              child: Text('과일'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('과일') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('양식');
              },
              child: Text('양식'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('양식') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('일식');
              },
              child: Text('일식'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('일식') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('생식 또는 요거트류');
              },
              child: Text('생식 또는 요거트류'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary: selectedOptions.contains('생식 또는 요거트류')
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FifthPage()),
                );
              },
              child: Container(
                width: 100,
                height:40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Text(
                    '해당 사항 없음',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                navigateToFifthPage();
              },
              child: Text('완료'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FifthPage extends StatefulWidget {
  @override
  _FifthPageState createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  Set<String> selectedOptions = {};

  void toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  void navigateToSixthPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SixthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('네 번째 질문'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              child: Text(
                '평소 규칙적인',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 300,
              child: Text(
                '식사습관을',
                style: TextStyle(fontSize: 33),
              ),
            ),
            Container(
              width: 300,
              child: Text(
                '가지고 있나요?',
                style: TextStyle(fontSize: 33),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Image.asset('soo/q4.png'),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('조식이 규칙적임');
              },
              child: Text('조식이 규칙적임'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary: selectedOptions.contains('조식이 규칙적임')
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('중식이 규칙적임');
              },
              child: Text('중식이 규칙적임'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('중식이 규칙적임') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('석식이 규칙적임');
              },
              child: Text('석식이 규칙적임'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('석식이 규칙적임') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('규칙적이지않음');
              },
              child: Text('규칙적이지않음'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('규칙적이지않음') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SixthPage()),
                );
              },
              child: Container(
                width: 100,
                height:40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Text(
                    '해당 사항 없음',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                navigateToSixthPage();
                // Perform actions or navigate to the next page
              },
              child: Text('완료'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SixthPage extends StatefulWidget {
  @override
  _SixthPageState createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  Set<String> selectedOptions = {};

  void toggleOption(String option) {
    setState(() {
      if (selectedOptions.contains(option)) {
        selectedOptions.remove(option);
      } else {
        selectedOptions.add(option);
      }
    });
  }

  void navigateToFinalPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SixthPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('다섯 번째 질문'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              child: Text(
                '폭식증 또는',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Container(
              width: 300,
              child: Text(
                '유해한 습관을',
                style: TextStyle(fontSize: 33),
              ),
            ),
            Container(
              width: 300,
              child: Text(
                '가지고 있나요?',
                style: TextStyle(fontSize: 33),
              ),
            ),
            SizedBox(height: 16),
            Container(
              width: 300,
              child: Padding(
                padding: EdgeInsets.all(50.0),
                child: Image.asset('soo/q5.png'),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('스트레스성 폭식');
              },
              child: Text('스트레스성 폭식'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary: selectedOptions.contains('스트레스성 폭식')
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                toggleOption('과식 또는 폭식 후 단식');
              },
              child: Text('과식 또는 폭식 후 단식'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                minimumSize: Size(300, 40),
                primary:
                selectedOptions.contains('과식 또는 폭식 후 단식') ? Colors.green : Colors.blue,
              ),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                // 동작 수행
              },
              child: Container(
                width: 100,
                height:40,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                  child: Text(
                    '해당 사항 없음',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                navigateToFinalPage();
                // Perform actions or navigate to the next page
              },
              child: Text('완료'),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

