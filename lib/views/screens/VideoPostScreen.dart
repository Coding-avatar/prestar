import 'package:flutter/material.dart';
import 'package:prestar/views/screens/PostScreen.dart';
import 'package:prestar/views/widgets/videoPost.dart';

import 'GoLiveDescriptionScreen.dart';
import 'HomeScreen.dart';
import 'ProfileScreen.dart';

class VideoPostScreen extends StatefulWidget {
  const VideoPostScreen({Key? key}) : super(key: key);

  @override
  _VideoPostScreenState createState() => _VideoPostScreenState();
}

class _VideoPostScreenState extends State<VideoPostScreen> {
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
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              VideoPost(
                userName: "Ruvim Miksanskiy",
                lastActiveTime: "5 min ago",
                numberOfComments: "142",
                numberOfLikes: "561",
                numberOfViews: "1042",
                videoDescription:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                videoThumbnail:
                    "https://images.pexels.com/videos/1526909/pictures/preview-1.jpg",
                videoTitle: "Seal on the beach",
                videoUrl:
                    "https://player.vimeo.com/external/296210754.sd.mp4?s=9db41d71fa61a2cc19757f656fc5c5c5ef9f69ec&profile_id=164&oauth2_token_id=57447761",
              ),
              VideoPost(
                userName: "Oleg Magni",
                lastActiveTime: "15 min ago",
                numberOfComments: "51",
                numberOfLikes: "997",
                numberOfViews: "2048",
                videoDescription:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                videoThumbnail:
                    "https://images.pexels.com/videos/1510090/pictures/preview-1.jpg",
                videoTitle: "Silhouette Of Maple Leaves",
                videoUrl:
                    "https://player.vimeo.com/external/295482071.sd.mp4?s=238ca35e1e9ae91fd08ce5e290c1f168c7f1fe1b&profile_id=164&oauth2_token_id=57447761",
              ),
              VideoPost(
                userName: "Visually Us",
                lastActiveTime: "1 hour ago",
                numberOfComments: "252",
                numberOfLikes: "704",
                numberOfViews: "1897",
                videoDescription:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                videoThumbnail:
                    "https://images.pexels.com/videos/1494284/pictures/preview-1.jpg",
                videoTitle: "Red Autumn leaves",
                videoUrl:
                    "https://player.vimeo.com/external/294394804.sd.mp4?s=0ae63fad00aa2702fd154632d9ed93fb7d7ee543&profile_id=164&oauth2_token_id=57447761",
              ),
              VideoPost(
                userName: "Pixabay",
                lastActiveTime: "2 hours ago",
                numberOfComments: "252",
                numberOfLikes: "10340",
                numberOfViews: "20440",
                videoDescription:
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                videoThumbnail:
                    "https://images.pexels.com/videos/856973/pictures/preview-1.jpg",
                videoTitle: "Sunset Time lapse video",
                videoUrl:
                    "https://player.vimeo.com/external/226685105.sd.mp4?s=90e56fbbb50fbc68a850f8db3f051c7465bfef71&profile_id=164&oauth2_token_id=57447761",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => GoLiveDescriptionScreen(),
                ),
              );
              break;
            case 3:
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
