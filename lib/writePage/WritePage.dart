import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:image_picker/image_picker.dart';

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
      home: WritePost(),
    );
  }
}

class WritePost extends StatefulWidget {
  @override
  _WritePostState createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  File? selectedImageFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        selectedImageFile = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: 'Title',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: contentController,
                decoration: InputDecoration(
                  hintText: 'Content',
                ),
                maxLines: null, // Allows multiple lines input
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
              child: GestureDetector(
                onTap: _pickImage,
                child: Image.asset(
                  'images/recipe/folder-plus.png',
                  width: 70,
                  height: 70,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Get the absolute path of the selected image file
                  String? imagePath = selectedImageFile?.path;

                  // Navigate to the ReadPage and pass the title, content, and image path as route arguments
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadPage(
                        title: titleController.text,
                        content: contentController.text,
                        imagePath: imagePath,
                      ),
                    ),
                  );
                },
                child: Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReadPage extends StatelessWidget {
  final String title;
  final String content;
  final String? imagePath;

  ReadPage({required this.title, required this.content, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Other Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: $title',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            Text(
              'Content: $content',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16.0),
            imagePath != null
                ? Image.file(
              File(imagePath!),
              width: 200,
              height: 200,
            )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}