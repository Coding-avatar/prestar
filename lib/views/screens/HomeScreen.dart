import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prestar/models/imagePostInfo.dart';
import 'package:prestar/views/screens/NotificationScreen.dart';
import 'package:prestar/views/screens/ProfileScreen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:prestar/views/widgets/imagePost.dart';
import 'package:prestar/views/screens/GoLiveDescriptionScreen.dart';
import 'package:prestar/views/screens/PostScreen.dart';
import 'package:prestar/views/screens/VideoPostScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ImagePostInfo> _postData = List.empty(growable: true);
  List bannerImages = [
    'https://images.pexels.com/photos/9247345/pexels-photo-9247345.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9245166/pexels-photo-9245166.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9245170/pexels-photo-9245170.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9226518/pexels-photo-9226518.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9443587/pexels-photo-9443587.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9351592/pexels-photo-9351592.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9329355/pexels-photo-9329355.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9321606/pexels-photo-9321606.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/7365263/pexels-photo-7365263.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9320447/pexels-photo-9320447.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9297975/pexels-photo-9297975.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9303791/pexels-photo-9303791.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9250013/pexels-photo-9250013.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9266627/pexels-photo-9266627.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
    'https://images.pexels.com/photos/9229072/pexels-photo-9229072.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
  ];

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
  @override
  void initState() {
    super.initState();
    fillData();
  }

  @override
  void dispose() {
    super.dispose();
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
                  // Container(
                  //   height: 55,
                  //   decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         colors: [Color(0xff153c8d), Color(0xff0d2454)],
                  //         begin: Alignment.topCenter,
                  //         end: Alignment.bottomCenter),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.only(left: 10),
                  //         child: Image.asset(
                  //           "assets/logo/prestarold.png",
                  //           height: 70,
                  //           color: Colors.white,
                  //           width: screenWidth / 3,
                  //         ),
                  //       ),
                  //       IconButton(
                  //         onPressed: null,
                  //         icon: ImageIcon(
                  //           AssetImage("assets/icons/bell.png"),
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
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
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      right: 10,
                      left: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Live Videos',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w800),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.blue,
                              fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                  ),
                  CarouselSlider.builder(
                    itemCount: bannerVideos.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Container(
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: Material(
                          elevation: 10,
                          shadowColor: Colors.black,
                          borderRadius: BorderRadius.circular(25),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: BetterPlayer.network(
                                bannerVideos[itemIndex]['video'],
                                betterPlayerConfiguration:
                                    BetterPlayerConfiguration(
                                  placeholder: Image.network(
                                      bannerVideos[itemIndex]['thumbnail']),
                                  autoPlay: false,
                                  controlsConfiguration:
                                      BetterPlayerControlsConfiguration(
                                          enableMute: true),
                                  aspectRatio: 16 / 9,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      // enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                  ListView.builder(
                    itemCount: _postData.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ImagePost(imageUrl: _postData[index].imageUrl);
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
    setState(() {
      _postData.add(ImagePostInfo(
        imageUrl:
            'https://images.pexels.com/photos/7365263/pexels-photo-7365263.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200',
        imageTitle: 'Image 1',
      ));
      _postData.add(ImagePostInfo(
        imageUrl:
            'https://images.pexels.com/videos/856065/pictures/preview-0.jpg',
      ));
    });
  }

  Future<bool> _onBackPressed() async {
    return (await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Do you want to exit an App'),
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
}
