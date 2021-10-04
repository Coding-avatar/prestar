import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:prestar/services/auth_provider.dart';
import 'package:prestar/views/screens/Profile/SettingsScreen.dart';
import 'package:prestar/views/screens/Profile/EditProfile/editProfileScreen.dart';
import 'package:prestar/views/custom_widgets/videoPost.dart';
import 'package:prestar/views/screens/Profile/userFollowersScreen.dart';
import 'package:prestar/views/screens/Profile/userFollowingScreen.dart';
import 'package:prestar/views/screens/Profile/userPostScreen.dart';
import 'package:prestar/views/screens/Profile/userVideosScreen.dart';
import '../GoLive/GoLiveDescriptionScreen.dart';
import '../../common_screens/NotificationScreen.dart';
import '../CreatePost/PostScreen.dart';
import '../Videos/VideoPostScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Rima Dutta", userLocation = "Kolkata";
  int userAge = 27;

  String userFollowing = "231",
      userFollowers = '1.3k',
      userVideos = '56',
      userPosts = '151';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      initialIndex: 1,
      length: 4,
      child: Scaffold(
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
            'Profile',
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
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenHeight / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/cover2.jpg"),
                            fit: BoxFit.cover),
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage("assets/images/profile2.jpg"),
                                radius: 55,
                              ),
                              PositionedDirectional(
                                bottom: 10,
                                end: 15,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0xffcdcdcd),
                                          blurRadius: 5.0,
                                        ),
                                      ]),
                                  child: Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white60,
                                  ),
                                ),
                              )
                            ],
                          ),
                          //UserName
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.black54,
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                          //User Age and Location
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${userAge.toString()} YEARS OLD',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.black54,
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                userLocation,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  shadows: <Shadow>[
                                    Shadow(
                                      color: Colors.black54,
                                      offset: Offset(2.0, 2.0),
                                      blurRadius: 3.0,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              shadows: <Shadow>[
                                Shadow(
                                  color: Colors.black54,
                                  offset: Offset(2.0, 2.0),
                                  blurRadius: 3.0,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => EditProfileScreen(),
                                  ),
                                ),
                                child: Container(
                                  width: screenWidth / 4,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Color(0xffd5dfee)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black87,
                                          blurRadius: 10),
                                    ],
                                  ),
                                  child: Text('Edit Profile'),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => SettingScreen(),
                                  ),
                                ),
                                child: Container(
                                  width: screenWidth / 4,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Color(0xffd5dfee)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black87,
                                          blurRadius: 10),
                                    ],
                                  ),
                                  child: Text('Settings'),
                                ),
                              ),
                              InkWell(
                                onTap: _signOut,
                                child: Container(
                                  width: screenWidth / 4,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        colors: [
                                          Colors.white,
                                          Color(0xffd5dfee)
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter),
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black87,
                                          blurRadius: 10),
                                    ],
                                  ),
                                  child: Text('Log out'),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 15,
                      child: InkWell(
                        onTap: () {
                          //  open camera to upload cover image
                        },
                        child: Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Color(0xffcdcdcd),
                              blurRadius: 5.0,
                            ),
                          ]),
                          child: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff153a88), Color(0xff0d2556)],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        )
                      ]),
                  padding: EdgeInsets.fromLTRB(5, 20, 5, 10),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.lightBlue,
                    labelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    unselectedLabelStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    indicatorWeight: 2,
                    tabs: [
                      Tab(
                        child: Column(
                          children: [
                            Text(userFollowing),
                            Text(
                              'Following',
                              softWrap: false,
                            )
                          ],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [Text(userFollowers), Text('Followers')],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [Text(userVideos), Text('Videos')],
                        ),
                      ),
                      Tab(
                        child: Column(
                          children: [Text(userPosts), Text('Posts')],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1600,
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      UserFollowingScreen(
                        uid: 'user whose following to display',
                      ),
                      UserFollowersScreen(
                          uid: 'user whose followers to display'),
                      UserVideosScreen(uid: 'user whose videos to display'),
                      UserPostScreen(uid: 'user whose post is to be displayed'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 4,
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CreatePostScreen(),
                  ),
                );
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
                break;
            }
          },
        ),
      ),
    );
  }

  void _signOut() {
    final auth = AuthProvider.of(context);
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}