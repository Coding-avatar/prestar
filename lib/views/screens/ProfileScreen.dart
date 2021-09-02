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

  String userFollowing = "231",
      userFollowers = '1.3k',
      userVideos = '56',
      userViews = '345';

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Profile'),
        centerTitle: true,
        actions: [Icon(Icons.more_vert)],
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight / 4,
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
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/images/profile1.jpg"),
                    radius: 55,
                  ),
                  //UserName
                  Text(userName),
                  //User Age and Location
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(userAge.toString()),
                      Text(' YEARS OLD '),
                      Text(userLocation),
                    ],
                  ),
                ],
              ),
            ),
            Text('Hello'),
          ],
        ),
      ),
    );
  }
}
