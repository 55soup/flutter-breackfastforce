import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(ReadApp());
}

class ReadApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text and Image Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ReadPage(),
    );
  }
}

class ReadPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 412,
          height: 914,
          child: Stack(
            children: [
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Image.asset(
                    'soo/image1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child:GestureDetector(
                      onTap: (){
                        //화살표 페이지 클릭 시 이동 또는 작동할? 코드
                      },

                      child: Image.asset(
                        'soo/arrow-left.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "모든 국민은 인간으로서의 존엄과 가치를 가지며,\n"
                          "행복을 추구할 권리를 가진다.\n\n"
                          "국가는 개인이 가지는 불가침의 기본적 인권을 확인하고\n"
                          "이를 보장할 의무를 진다.\n\n"
                          "대통령으로 선거될 수 있는 자는 국회의원의 피선거권이 있고\n"
                          "선거일 현재 40세에 달하여야 한다.\n\n"
                          "국무총리는 대통령을 보좌하며,\n"
                          "행정에 관하여 대통령의 명을 받아 행정각부를 통할한다.\n\n"
                          "국가는 평생교육을 진흥하여야 한다.\n\n"
                          "국회는 국정을 감사하거나\n"
                          "특정한 국정사안에 대하여 조사할 수 있으며,\n\n"
                          "이에 필요한 서류의 제출 또는 증인의 출석과 증언이나\n"
                          "의견의 진술을 요구할 수 있다.",
                      maxLines: 999999999999999,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Image.asset(
                      'soo/image1.jpg',
                      width: 200,
                      height: 200,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}