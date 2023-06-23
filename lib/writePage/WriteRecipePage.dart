import 'package:flutter/material.dart';

class WriteRecipePostApp extends StatefulWidget {
  @override
  _WriteRecipeState createState() => _WriteRecipeState();
}

class _WriteRecipeState extends State<WriteRecipePostApp> {
  List<String> categories = [
    '생선 및 육류',
    '면류',
    '유가공품',
    '즉석식품류',
    '빵떡류',
    '생식 및 음료류',
  ];

  List<String> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.all(16.0),
          child: Image.asset('images/recipe/arrow-left.png', width: 40, height: 40),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white, // 배경색 설정
            child: Row(
              children: [
                Expanded(
                  child: Flex(
                    direction: Axis.horizontal,
                    children: categories.map((category) {
                      bool isSelected = selectedCategories.contains(category);
                      return Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                selectedCategories.remove(category);
                              } else {
                                selectedCategories.add(category);
                              }
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.blue : Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: isSelected ? Colors.blue : Colors.grey,
                                width: 1.0,
                              ),
                            ),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
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
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  'images/recipe/folder-plus.png',
                  width: 50,
                  height: 50,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  // 작성 버튼 클릭 시 실행되는 코드
                  // 입력된 제목과 내용을 처리하는 로직을 여기에 추가
                },
                child: Text('작성'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}