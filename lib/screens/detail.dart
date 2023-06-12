import 'package:breakfastforce/screens/recipe.dart';
import 'package:flutter/material.dart';

// 상세페이지
class Detail extends StatelessWidget {

  final String recipaData;
  final String recipImag;
  final String recipTime;
  final String reciplevel;
  final String recipComment;

  const Detail({Key? key, required this.recipaData, required this.recipImag, required this.recipTime, required this.reciplevel, required this.recipComment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text(recipaData)),
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(32.5),
                  child: Image.asset(recipImag,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        onPressed: (){Navigator.pop(context);},
                        icon: Icon(Icons.arrow_back_outlined), iconSize: 50,)
                    ],
                  )),
            ],
          ),
          Positioned(
              bottom: -100,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 800,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(35.0)),
                ),
                child: Column(
                  children: [
                      Text(recipaData),
                      Text(reciplevel),
                      Text(recipTime),
                      Text(recipComment),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
