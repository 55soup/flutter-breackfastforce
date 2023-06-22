import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String recipImag1;

  Detail({
    required this.recipImag1,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('상세 페이지'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(recipImag1,),  // 넘어온 이미지를 배경화면으로 설정
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
