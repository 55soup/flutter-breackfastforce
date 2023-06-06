import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(WritePostApp());
}

class WritePostApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      home: WritePost(),
    );
  }
}

class WritePost extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(16.0),
          child: Image.asset('assets/soo/arrow-left.png',width:40, height:40),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: '제목',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: '내용',
                ),
                maxLines: null, // 여러 줄 입력 가능
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/soo/folder-plus.png',
                width: 50,
                height: 50,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // 작성 버튼 클릭 시 실행되는 코드
                  // 입력된 제목과 내용을 처리하는 로직을 여기에 추가
                },

                child: Text('작성'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}