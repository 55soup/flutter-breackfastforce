import 'package:flutter/material.dart';

List subscribeText = [
  ["주 35,900원", "간헐적 식단", "다이어터들의 최고의 식단!", 'images/recipe/sub1.png', 'images/recipe/f2.png'],
  ["주 17,500원", "간단 식단", "가성비갑! 식단", 'images/recipe/sub2.png', 'images/recipe/f1.png'],
  ["주 56,000원", "레드 패키지", "항암 효과가 있는 식단", 'images/recipe/sub3.png', 'images/recipe/f3.png'],
  ["주 35,900원", "자취생 피키지", "간단히 먹을 수 있는 식단", 'images/recipe/sub4.png', 'images/recipe/f5.png'],
  ["주 17,500원", "곤약 간단 패키지", "다이어터들의 최고의 식단", 'images/recipe/sub5.png', 'images/recipe/f4.png'],
];

void main() => runApp(MaterialApp(title: 'Subscribe',home: Subscribe()));

class Subscribe extends StatelessWidget {
  Subscribe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/subscribe/subscribe-background.png'),
          ),
        ),
        child: Column(
          children: <Widget>[
            _subText(),
            _sub(context),
          ],
        ),
      ),
    );
  }
}

Widget _subText() {
  return Container(
    width: double.infinity,
    height: 50,
    margin: EdgeInsets.fromLTRB(20, 80, 0, 0),
    child: Text(
      "SUBSCRIBE SERVICE",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Color(0xffffffff),
      ),
    ),
  );
}

Widget _sub(context) {
  return Container(
    width: double.infinity,
    height: 700,
    child: ListView.builder(
      itemCount: subscribeText.length,
      itemBuilder: (BuildContext context, int i) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(subscribeText: subscribeText[i], imagePath: subscribeText[i][3],),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6.0,
                  offset: Offset(0, 6),
                )
              ],
            ),
            margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            width: 50,
            height: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(subscribeText[i][0], textAlign: TextAlign.start,),
                      Text(" / " + subscribeText[i][1]),
                    ],
                  ),
                    Row(
                      children: [Text(subscribeText[i][2], textAlign: TextAlign.left,)],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4),
                          child: FilledButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailPage(subscribeText: subscribeText[i], imagePath: subscribeText[i][3],),
                                ),
                              );
                            },
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: Colors.red),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xffffffff)),
                            ),
                            child: Text(
                              "바로 구독하기",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffF56666),
                              ),
                            ),
                          ),
                          width: 120,
                          height: 40,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(subscribeText[i][4], width: 70, height: 70,),
                  ],
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}

class DetailPage extends StatelessWidget {
  final List<String> subscribeText;
  final String imagePath;

  DetailPage({required this.subscribeText, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),
        title: Text(subscribeText[1]),
      ),
      body: SingleChildScrollView( // Add this line
        child: Container(
          width: double.infinity, // Update this line
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(imagePath),
            ),
          ),
          padding: EdgeInsets.fromLTRB(0, 1050, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Rest of the code...
            ],
          ),
        ),
      ),
    );
  }
}

class FilledButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle style;
  final Widget child;

  const FilledButton({
    Key? key,
    required this.onPressed,
    required this.style,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
