import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prestar/views/screens/GoLiveDescriptionScreen.dart';
import 'package:prestar/views/screens/VideoPostScreen.dart';
import 'package:image_picker/image_picker.dart';

import 'package:prestar/views/screens/ProfileScreen.dart';

import 'NotificationScreen.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  String userName = "Rima Dutta";
  File? _imageFile;
  final _picker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color(0xfff1eeee),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).popUntil(
              (route) => route.isFirst,
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/logo/prestar_small_logo.png",
              height: 30,
              width: screenWidth / 3,
            ),
          ),
        ),
        title: Text(
          'Create Post',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NotificationScreen(),
              ),
            ),
            icon: ImageIcon(
              AssetImage("assets/icons/bell.png"),
              color: Colors.indigo,
            ),
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile2.jpg"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('$userName'),
                  Expanded(child: Container()),
                  IconButton(
                    icon: const Icon(Icons.photo_camera),
                    onPressed: () async => _pickImageFromCamera(),
                    tooltip: 'Shoot picture',
                  ),
                  IconButton(
                    icon: const Icon(Icons.photo),
                    onPressed: () async => _pickImageFromGallery(),
                    tooltip: 'Pick from gallery',
                  ),
                ],
              ),
            ),
            if (this._imageFile == null)
              Container(
                width: double.infinity,
                height: screenHeight / 3.5,
                child: Image.asset(
                  "assets/images/uploadPhoto.png",
                  fit: BoxFit.contain,
                ),
              )
            else
              Container(
                width: double.infinity,
                height: screenHeight / 3.5,
                child: Image.file(
                  this._imageFile!,
                  fit: BoxFit.contain,
                ),
              ),
            Container(
              width: double.infinity,
              height: screenHeight / 3.5,
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'What\'s on your mind?',
                  hintStyle: TextStyle(color: Colors.black12, fontSize: 24),
                ),
                maxLines: 4,
                style: TextStyle(color: Colors.black54, fontSize: 24),
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              padding: EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  print('post created');
                },
                child: Text('Create Post'),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        items: [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/home.png"),
            ),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/post.png"),
            ),
            label: 'Post',
            tooltip: 'Post  ',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/video-camera.png"),
            ),
            label: 'Go Live',
            tooltip: 'Go Live',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/video.png"),
            ),
            label: 'Videos',
            tooltip: 'Videos',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/user.png"),
            ),
            label: 'Profile',
            tooltip: 'Profile',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.of(context).popUntil(
                (route) => route.isFirst,
              );
              break;
            case 1:
              break;
            case 2:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => GoLiveDescriptionScreen(),
                ),
              );
              break;
            case 3:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoPostScreen(),
                ),
              );
              break;
            case 4:
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
              break;
          }
        },
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    var status = await Permission.camera.status;
    if (await Permission.camera.request().isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() => this._imageFile = File(pickedFile.path));
      }
    }
  }

  Future<void> _pickImageFromCamera() async {
    var status = await Permission.camera.status;
    if (await Permission.camera.request().isGranted) {
      final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() => this._imageFile = File(pickedFile.path));
      }
    } else {
      print('premission not granted');
    }
  }
}
