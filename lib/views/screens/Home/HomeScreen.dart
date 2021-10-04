import 'dart:convert';

import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:prestar/constants/shared_preference_constants.dart';
import 'package:prestar/models/api_models/mongoUser.dart';
import 'package:prestar/models/api_models/posts.dart';
import 'package:prestar/models/imagePostInfo.dart';
import 'package:prestar/services/HttpService.dart';
import 'package:prestar/views/common_screens/NotificationScreen.dart';
import 'package:prestar/views/custom_widgets/errorDialog.dart';
import 'package:prestar/views/screens/Profile/ProfileScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prestar/views/custom_widgets/imagePost.dart';
import 'package:prestar/views/screens/GoLive/GoLiveDescriptionScreen.dart';
import 'package:prestar/views/screens/CreatePost/PostScreen.dart';
import 'package:prestar/views/screens/Profile/userFollowersScreen.dart';
import 'package:prestar/views/screens/Videos/VideoPostScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(this.email, {Key? key}) : super(key: key);
  final String email;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PackageInfo packageInfo;
  late String appVersion;
  List<Posts> _postData = List.empty(growable: true);
  List bannerImages = List.empty(growable: true);
  List bannerVideos = [
    {
      'thumbnail':
          'https://images.pexels.com/videos/1526909/pictures/preview-0.jpg',
      'video':
          "https://player.vimeo.com/external/296210754.sd.mp4?s=9db41d71fa61a2cc19757f656fc5c5c5ef9f69ec&profile_id=164&oauth2_token_id=57447761"
    },
    {
      'thumbnail':
          'https://images.pexels.com/videos/1510090/pictures/preview-0.jpg',
      'video':
          "https://player.vimeo.com/external/295482071.sd.mp4?s=238ca35e1e9ae91fd08ce5e290c1f168c7f1fe1b&profile_id=164&oauth2_token_id=57447761"
    },
    {
      'thumbnail':
          "https://images.pexels.com/videos/1494284/pictures/preview-0.jpg",
      'video':
          "https://player.vimeo.com/external/294394804.sd.mp4?s=0ae63fad00aa2702fd154632d9ed93fb7d7ee543&profile_id=164&oauth2_token_id=57447761"
    },
    {
      'thumbnail':
          "https://images.pexels.com/videos/856973/pictures/preview-0.jpg",
      'video':
          "https://player.vimeo.com/external/226685105.sd.mp4?s=90e56fbbb50fbc68a850f8db3f051c7465bfef71&profile_id=164&oauth2_token_id=57447761"
    },
    {
      'thumbnail':
          "https://images.pexels.com/videos/856065/pictures/preview-0.jpg",
      'video':
          "https://player.vimeo.com/external/214503838.sd.mp4?s=0aac7d3caa1d5eedbd97234814b1ca37904b71b2&profile_id=164&oauth2_token_id=57447761"
    },
  ];
  late String email;
  @override
  void initState() {
    super.initState();
    email = widget.email;
    PackageInfo.fromPlatform().then((packageInfo) {
      this.packageInfo = packageInfo;
      setState(() {
        appVersion = packageInfo.version;
      });
      print('build number : ${packageInfo.buildNumber}');
    });
    fetchBannerList();
    fillData();
    checkForUpdates();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> storeMongoDbUserDetails(
      {required String uid,
      required String name,
      required String email}) async {
    print('called update data');
    print(uid);
    print(name);
    print(email);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Constants.MongoDbUser, uid);
    sharedPreferences.setString(Constants.MongoDbUserName, name);
    sharedPreferences.setString(Constants.MongoDbUserEmail, email);
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xfff1eeee),
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
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: SafeArea(
          child: Container(
            width: screenWidth,
            height: screenHeight,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.search,
                            color: Color(0xff092497),
                            size: 25,
                          ),
                        ),
                        Expanded(
                          child: Material(
                            elevation: 15,
                            shadowColor: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                            child: TextField(
                              decoration: new InputDecoration(
                                border: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  // borderSide: new BorderSide(color: Colors.teal),
                                ),
                                enabledBorder: new OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: new BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                isDense: true,
                                hintText: 'Search',
                                hintStyle:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: bannerImages.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 20),
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              bannerImages[itemIndex],
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 160,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      // enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   padding: EdgeInsets.only(
                  //     right: 10,
                  //     left: 10,
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text(
                  //         'Recent Live Videos',
                  //         style: TextStyle(
                  //             fontSize: 18,
                  //             color: Colors.black87,
                  //             fontWeight: FontWeight.w800),
                  //       ),
                  //       InkWell(
                  //         onTap: () =>
                  //             Navigator.of(context).push(MaterialPageRoute(
                  //                 builder: (context) => UserFollowersScreen(
                  //                       uid: 'test',
                  //                     ))),
                  //         child: Text(
                  //           'View All',
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               color: Colors.blue,
                  //               fontWeight: FontWeight.w800),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // CarouselSlider.builder(
                  //   itemCount: bannerVideos.length,
                  //   itemBuilder: (BuildContext context, int itemIndex,
                  //           int pageViewIndex) =>
                  //       Container(
                  //     child: Container(
                  //       width: double.infinity,
                  //       padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                  //       child: Material(
                  //         elevation: 10,
                  //         shadowColor: Colors.black,
                  //         borderRadius: BorderRadius.circular(25),
                  //         child: ClipRRect(
                  //           borderRadius: BorderRadius.circular(25),
                  //           child: AspectRatio(
                  //             aspectRatio: 16 / 9,
                  //             child: BetterPlayer.network(
                  //               bannerVideos[itemIndex]['video'],
                  //               betterPlayerConfiguration:
                  //                   BetterPlayerConfiguration(
                  //                 placeholder: Image.network(
                  //                     bannerVideos[itemIndex]['thumbnail']),
                  //                 autoPlay: true,
                  //                 controlsConfiguration:
                  //                     BetterPlayerControlsConfiguration(
                  //                         enableMute: true),
                  //                 aspectRatio: 16 / 9,
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //   options: CarouselOptions(
                  //     viewportFraction: 1,
                  //     initialPage: 0,
                  //     enableInfiniteScroll: true,
                  //     reverse: false,
                  //     autoPlay: true,
                  //     autoPlayInterval: Duration(seconds: 5),
                  //     autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //     autoPlayCurve: Curves.fastOutSlowIn,
                  //     // enlargeCenterPage: true,
                  //     scrollDirection: Axis.horizontal,
                  //   ),
                  // ),
                  _postData.length == 0
                      ? Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          itemCount: _postData.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ImagePost(
                              post: _postData[index],
                            );
                          },
                        )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
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

  void fillData() {
    HttpService().fetchAllPost().then((res) {
      if (res.statusCode == 200) {
        var responseJson = jsonDecode(res.body);
        responseJson.forEach((data) {
          Posts post = Posts.fromJson(data);
          _postData.add(post);
        });
        setState(() {});
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(
                  titleText: "Network Error",
                  errorMessage: "Sorry could not fetch posts");
            });
      }
    });
    HttpService().findUserWithEmail(email: email).then((res) {
      print('finding user from mongo');
      MongoUser currentUser = MongoUser.fromJson(jsonDecode(res.body));
      storeMongoDbUserDetails(
          uid: currentUser.sId, name: currentUser.name, email: email);
    });
  }

  Future<bool> _onBackPressed() async {
    return (await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirm Exit?'),
                content: Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                ],
              );
            })) ??
        false;
  }

  Future<void> fetchBannerList() async {
    try {
      var result = await FirebaseFirestore.instance
          .collection("/appData")
          .doc('banners')
          .get();
      result.data()!.entries.forEach((element) {
        setState(() {
          bannerImages.add(element.value);
        });
      });
    } catch (e) {
      print(e.toString());
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(
                titleText: "Network Error", errorMessage: e.toString());
          });
    }
  }

  void checkForUpdates() async {
    try {
      await FirebaseFirestore.instance
          .collection("/appData")
          .doc('updateInfo')
          .get()
          .then((document) {
        if (appVersion != document.get("appVersion")) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return WillPopScope(
                  onWillPop: () => Future.value(false),
                  child: AlertDialog(
                    content: Container(
                      height: 250,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.green,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "ALERT!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    launch(document.get("downloadUrl"));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    child: Text(
                                      'UPDATE APP',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.green),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => SystemNavigator.pop(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    child: Text(
                                      'CLOSE APP',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white),
                                    ),
                                  ),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        } else {
          print('app is up to date');
        }
      });
    } catch (e) {
      print(e.toString());
      showDialog(
          context: context,
          builder: (context) {
            return ErrorDialog(
                titleText: "Network Error", errorMessage: e.toString());
          });
    }
  }
}
