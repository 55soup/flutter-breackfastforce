import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

const COLOR_PINK = Color(0xffFFEBE4);

void main()  => runApp(DiaryWrite()); // 프로그램을 실행할 때 MyApp 부터 실행하겠어!

Future _openDb() async {
  final databasePath = await getDatabasesPath();
  String path = join(databasePath, 'my_database.db');

  final db = await openDatabase(
    path,
    version: 1,
    onConfigure: (Database db) => {},
    onCreate: (Database db, int version) => {},
    onUpgrade: (Database db, int oldVersion, int newVersion) => {},
  );
}

Future _onCreate(Database db, int version) async {
  await db.execute('''
    CREATE TABLE IF NOT EXISTS posts (
      id INTEGER PRIMARY KEY,
      title TEXT NOT NULL,
      content TEXT NOT NULL,
      date TEXT NOT NULL
    )
  ''');
}

Future add(item) async {
  final db = await _openDb();
  item.id = await db.insert(
    'diary',  // table name
    {
      'title': 'new post ...',
      'content': 'this is add method',
      'date': '2022-01-01 00:00:00',
    },  // new post row data
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  return item;
}
// StatelessWidget은 변화지 않는 화면을 작업할 때 사용.
// 변화는 화면을 작업 하고싶을 경우에는 StatefulWidget을 사용.
class DiaryWrite extends StatelessWidget {
  // MaterialApp = 앱으로서 기능을 할 수 있도록 도와주는 뼈대
  @override
  Widget build(BuildContext context) {

    // return MaterialApp() -> Material 디자인 테마를 사용
    return MaterialApp(
      title: "diarywrite", // 앱 이름
      debugShowCheckedModeBanner: false, // 타이틀 바 우측 띠 제거
      // 앱의 기본적인 테마를 지정
      theme: ThemeData(
        primarySwatch: Colors.blue, // priamrySwatch 기본적인 앱의 색상을 지정
      ),
      home: MyWidget(), // 앱이 실행될 때 표시할 화면의 함수를 호출
    );
  }
}

// 앱이 실행 될때 표시할 화면의 함수
class MyWidget extends StatelessWidget {
  File? _image;

  // scaffold = 구성된 앱에서 디자인적인 부분을 도와주는 뼈대
  // 화면 구성
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar에 AppBar 위젯을 가져온다.
        appBar: AppBar(title : Text("일기작성")),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(check_date(context)),
              TextField(
                decoration: InputDecoration(
                  hintText: "오늘 먹은 아침은?",
                  border: InputBorder.none, //border 스타일 없애기
                ),
                style: TextStyle(fontSize: 30),
                maxLength: 30,
              ),
              const Expanded(child: TextField(
                decoration: InputDecoration(
                  hintText: "아침과 관련한 나의 이야기",
                  border: InputBorder.none, //border 스타일 없애기
                ),
                maxLines: 100,
              )),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _image != null ? Image.file(_image!, width: 250, height: 250, fit: BoxFit.cover) :
                  Image.network('https://picsum.photos/250?image=9'),
                  IconButton( onPressed: getImageFromGallery,
                   icon:Icon(Icons.camera_alt_outlined)),
                  TextButton(
                    onPressed: (){

                    },
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.black),
                      backgroundColor: MaterialStateProperty.all(COLOR_PINK),
                      padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                    child: Text("작성완료"),
                  )
                ],
              )
            ],
          )
        )
    );
  }
}

String check_date(BuildContext context){ //오늘 날짜를 불러옴.
  var now = new DateTime.now();
  String formatDate = DateFormat('yyyy년 MM월 dd일').format(now);
  return formatDate;
}

Future getImageFromGallery() async {
  var picker = ImagePicker();
  var image = await picker.pickImage(source: ImageSource.gallery);
  if( image == null ) return;
  final imageTemporary = File(image.path);

  // setState(() {
  //
  // });
}
