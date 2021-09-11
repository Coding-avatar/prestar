import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prestar/views/screens/PostScreen.dart';

import 'HomeScreen.dart';
import 'ProfileScreen.dart';
import 'VideoPostScreen.dart';

class GoLiveDescriptionScreen extends StatefulWidget {
  const GoLiveDescriptionScreen({Key? key}) : super(key: key);

  @override
  _GoLiveDescriptionScreenState createState() =>
      _GoLiveDescriptionScreenState();
}

class _GoLiveDescriptionScreenState extends State<GoLiveDescriptionScreen> {
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
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title'),
            TextField(),
            Text('Description'),
            TextField(),
            Text('Description'),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => CreatePostScreen(),
                ),
              );
              break;
            case 2:
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
}
