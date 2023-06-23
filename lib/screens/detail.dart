import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String recipImag1;

  Detail({
    required this.recipImag1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black),),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipImag1,),  // 넘어온 이미지를 배경화면으로 설정
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
    );
  }
}
