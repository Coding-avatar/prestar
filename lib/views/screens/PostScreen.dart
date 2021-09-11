import 'package:flutter/material.dart';
import 'package:prestar/models/imagePostInfo.dart';
import 'package:prestar/views/screens/GoLiveDescriptionScreen.dart';
import 'package:prestar/views/screens/HomeScreen.dart';
import 'package:prestar/views/screens/VideoPostScreen.dart';
import 'package:prestar/views/widgets/imagePost.dart';

import 'ProfileScreen.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({Key? key}) : super(key: key);

  @override
  _CreatePostScreenState createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  List<ImagePostInfo> _postData = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff1eeee),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            "assets/logo/prestarold.png",
            height: 40,
            width: screenWidth / 3,
          ),
        ),
        leadingWidth: 130,
        centerTitle: true,
        // actions: [
        //   IconButton(
        //     onPressed: null,
        //     icon: ImageIcon(
        //       AssetImage("assets/icons/bell.png"),
        //       color: Colors.black87,
        //     ),
        //   ),
        //   SizedBox(
        //     width: 15,
        //   )
        // ],
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: ListView.builder(
          itemCount: _postData.length,
          itemBuilder: (context, index) {
            return ImagePost(imageUrl: _postData[index].imageUrl);
          },
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
              break;
            case 1:
              break;
            case 2:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => GoLiveDescriptionScreen(),
                ),
              );
              break;
            case 3:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => VideoPostScreen(),
                ),
              );
              break;
            case 4:
              Navigator.of(context).pushReplacement(
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

  void fillData() {
    setState(() {
      _postData.add(ImagePostInfo(
        imageUrl:
            'https://images.pexels.com/videos/856065/pictures/preview-0.jpg',
        imageTitle: 'Image 1',
      ));
      _postData.add(ImagePostInfo(
        imageUrl:
            'https://images.pexels.com/videos/856065/pictures/preview-0.jpg',
      ));
    });
  }
}
