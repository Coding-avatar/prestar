import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "Rima Dutta", userLocation = "Kolkata";
  int userAge = 27;

  String userFollowing = "231", userFollowers = '1.3k', userVideos = '56';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('Profile'),
          centerTitle: true,
          actions: [Icon(Icons.more_vert)],
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Stack(children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
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
                          height: 40,
                        ),
                        Stack(
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/profile1.jpg"),
                              radius: 55,
                            ),
                            PositionedDirectional(
                              bottom: 10,
                              end: 15,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.white60,
                              ),
                            )
                          ],
                        ),
                        //UserName
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          userName,
                          style: TextStyle(
                            fontSize: 24,
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
                        //User Age and Location
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '${userAge.toString()} YEARS OLD',
                              style: TextStyle(
                                fontSize: 15,
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
                                fontSize: 14,
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
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 500,
                    child: TabBarView(
                      children: [
                        Container(
                          width: double.infinity,
                          child: Text('Page1'),
                          color: Colors.blueAccent,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text('Page2'),
                          color: Colors.redAccent,
                        ),
                        Container(
                          width: double.infinity,
                          child: Text('Page3'),
                          color: Colors.grey,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 230, 20, 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff092497),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.lightBlue,
                  // labelColor: Color(0xff99E851),
                  // unselectedLabelColor: Color(0xffE89980),
                  labelStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  indicatorWeight: 2,
                  tabs: [
                    Tab(
                      child: Column(
                        children: [Text(userFollowing), Text('Following')],
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
                  ],
                ),
              ),
            ]),
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
                AssetImage("assets/icons/video-camera.png"),
              ),
              label: 'Videos',
              tooltip: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/video.png"),
              ),
              label: 'Video',
              tooltip: 'Video',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/bell.png"),
              ),
              label: 'Notification',
              tooltip: 'Notifications',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage("assets/icons/user.png"),
              ),
              label: 'Profile',
              tooltip: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
