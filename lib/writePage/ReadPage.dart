import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui' as ui;

void main() {
  runApp(const ReadApp());
}

class ReadApp extends StatelessWidget {
  const ReadApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text and Image Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WritePost(),
    );
  }
}

class WritePost extends StatefulWidget {
  const WritePost({Key? key}) : super(key: key);

  @override
  _WritePostState createState() => _WritePostState();
}

class _WritePostState extends State<WritePost> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  File? selectedImageFile;
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedImage =
    await _imagePicker.pickImage(source: ImageSource.gallery);

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: 'Title',
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: contentController,
                decoration: const InputDecoration(
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
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: _pickImage,
                // 이미지 -> 아이콘
                child: const Icon(Icons.drive_folder_upload_outlined, size: 40),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: () {
                  // Navigate to the ReadPage and pass the title, content, and imageFile as route arguments
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadPage(
                        title: titleController.text,
                        content: contentController.text,
                        imageFile: selectedImageFile,
                      ),
                    ),
                  );
                },
                child: const Text('Submit'),
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
  final File? imageFile;

  const ReadPage(
      {
        required this.title,
        required this.content,
        required this.imageFile});

  @override
  Widget build(BuildContext context) {
    String? imagePath = imageFile != null ? imageFile!.path : null;

    return Scaffold(
      // appbar 추가
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_left,
          size: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 412,
          height: 914,
          child: Stack(
            children: [
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: imagePath != null
                      ? Image.network(
                    imagePath,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'soo/image1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        // Handle arrow page click
                      },
                      // 이미지 -> 아이콘
                      child: const Icon(Icons.arrow_left, size: 40),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      title,
                      maxLines: 999999999999999,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      content,
                      maxLines: 999999999999999,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: imagePath != null
                        ? Image.network(
                      imagePath,
                      width: 200,
                      height: 200,
                    )
                        : const SizedBox(),
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