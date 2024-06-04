import 'dart:io';
import 'package:applicationpef/models/post.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:applicationpef/services/PostService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YourAddPostScreen extends StatefulWidget {
  const YourAddPostScreen({Key? key}) : super(key: key);

  @override
  _YourAddPostScreenState createState() => _YourAddPostScreenState();
}

PostService _postService = PostService();

class _YourAddPostScreenState extends State<YourAddPostScreen> {
  
  late TextEditingController _descriptioncntrl;
  late TextEditingController _countrycntrl;
  late File _imageFile = File(''); 

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _descriptioncntrl = TextEditingController();
    _countrycntrl = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _descriptioncntrl.dispose();
    _countrycntrl.dispose();
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: _getImage,
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: _imageFile != null
                      ? Image.file(
                          _imageFile,
                          fit: BoxFit.cover,
                        )
                      : const Icon(
                          Icons.add_photo_alternate,
                          size: 30,
                          color: Colors.grey,
                        ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _descriptioncntrl,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _countrycntrl,
                decoration: const  InputDecoration(
                  labelText: 'Country',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _addPost(); // Appeler la méthode _addPost ici
                },
                child: const Text('Add Post'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _addPost() async {
    String description = _descriptioncntrl.text;
    String country = _countrycntrl.text;
    DateTime date = DateTime.now();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userId = prefs.getString('_id');

    if (userId == null) {
      print('User ID not found');
      return;
    }

    _postService.addPost(
      Post(
        postCountry: country,
        description: description,
        imagePost: _imageFile.path,
        date: date,
        owner: userId,
      ),
      _imageFile,
    );
  }
}

