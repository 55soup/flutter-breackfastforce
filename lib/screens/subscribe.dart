import 'package:flutter/material.dart';

List subscribeText = [
  ["주 35,900원", "간헐적 식단", "다이어터들의 최고의 식단!"],
  ["주 17,500원", "간단 식단", "가성비갑! 간단히 먹을 수 있는 식단"],
  ["주 56,000원", "레드 패키지", "비트, 방울토마토 등 항암 효과가 있는 식단"],
  ["주 35,900원", "간헐적 식단", "다이어터들의 최고의 식단!"],
  ["주 17,500원", "간단 식단", "가성비갑! 간단히 먹을 수 있는 식단"],
  ["주 56,000원", "레드 패키지", "비트, 방울토마토 등 항암 효과가 있는 식단"],
  ["주 35,900원", "간헐적 식단", "다이어터들의 최고의 식단!"],
  ["주 17,500원", "간단 식단", "가성비갑! 간단히 먹을 수 있는 식단"],
  ["주 56,000원", "레드 패키지", "비트, 방울토마토 등 항암 효과가 있는 식단"],
];

void main() => runApp(MaterialApp(title: 'Subscribe', home: Subscribe()));

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
            )
        ),
        child: Column(
          children: <Widget>[
            _subText(),
            _sub(context),
          ],
        ),
      )
    );
  }
}

Widget _subText() {
  return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.fromLTRB(20, 80, 0, 0),
      child: Text("SUBSCRIBE SERVICE", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Color(0xffffffff)),)
  );
}

Widget _sub(context) {
  return Container(
    width: double.infinity,
    height: 700,
    child: ListView.builder(
      itemCount: subscribeText.length,
      itemBuilder: (BuildContext context, int i) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
              boxShadow: [
                BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 0,
                  blurRadius: 6.0,
                  offset: Offset(0, 6)
              )
            ]
          ),
          margin: EdgeInsets.fromLTRB(30, 20, 30, 0), // 좌 상 우 하
          padding: EdgeInsets.fromLTRB(20, 30, 20, 20), // 좌 상 우 하
          width: 50, height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [Text(subscribeText[i][0]), Text(" / " + subscribeText[i][1]),],
              ),
              Row(
                children: [Text(subscribeText[i][2])],
              ),
              Row(
                children: [
                  Container(padding: EdgeInsets.all(4),
                    child: FilledButton(
                      onPressed: (){
                      },
                      style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.red)
                          )
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xfffff)),
                      ),
                      child: Text("바로 구독하기", textAlign: TextAlign.center, style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xffF56666)),),
                    ),
                    width: 120,
                    height: 40,
                  ),
                ],
              )
            ],
          ),
        );
      },
    ),
  );
}

