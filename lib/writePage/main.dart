import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.asset('logo.jpg', width: 40),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {

              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('트윙크님 안녕하세요', style: TextStyle(fontSize: 30),),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '검색',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('식사하면서 보세요!', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 400,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      child:
                      Image.asset('image1.jpg', fit: BoxFit.cover),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      child:
                      Image.asset('image2.jpg', fit: BoxFit.cover),
                    ),
                    Container(
                      width: 300,
                      height: 300,
                      child:
                      Image.asset('image3.jpg', fit: BoxFit.cover),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                Text('식사하면서 보세요!', style: TextStyle(fontSize: 20)),
              ),
              SizedBox(
                height: 400,
                child:
                ListView(scrollDirection:
                Axis.horizontal,
                  children:[
                    Container(width:
                    300,height:
                    300,child:
                    Image.asset('image1.jpg',fit:
                    BoxFit.cover),),Container(width:
                    300,height:
                    300,child:
                    Image.asset('image2.jpg',fit:
                    BoxFit.cover),),Container(width:
                    300,height:
                    300,child:
                    Image.asset('image3.jpg',fit:
                    BoxFit.cover),),
                  ],),),],),),),);}}


