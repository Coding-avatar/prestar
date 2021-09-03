import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:prestar/views/screens/videoPost.dart';

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
                              height: 40,
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
                      Positioned(
                        top: 10,
                        right: 15,
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
                      )
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 560,
                    child: TabBarView(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            runSpacing: 15,
                            children: followingTab(screenWidth),
                          ),
                          color: Colors.white,
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          color: Colors.white,
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            runSpacing: 15,
                            children: followersTab(screenWidth),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '56 Videos',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff092497)),
                                  ),
                                  IconButton(
                                    onPressed: null,
                                    icon: Icon(Icons.search,
                                        size: 30, color: Color(0xff092497)),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: ListView(
                                  children: [
                                    VideoPost(),
                                  ],
                                ),
                              )
                            ],
                          ),
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

  List<Widget> followingTab(double screenWidth) {
    return [
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile2.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$userName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$userName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$userName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile2.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$userName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile2.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$userName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                '$userName',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ];
  }

  List<Widget> followersTab(double screenWidth) {
    return [
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Mr. Cat',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Mr. Cat',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Mr. Cat',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Mr. Cat',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Mr. Cat',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
      Card(
        color: Color(0xff092497),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          width: screenWidth / 2.3,
          height: screenWidth / 2.4,
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 32,
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Mr. Cat',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                userLocation,
                style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    ];
  }
}
