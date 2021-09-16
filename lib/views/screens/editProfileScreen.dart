import 'package:flutter/material.dart';
import 'package:prestar/views/screens/businessProfileScreen.dart';
import 'package:prestar/views/screens/myProfileScreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
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
        ),
        body: Container(
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TabBar(
                  tabs: [
                    Text(
                      'My Profile',
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                    Text(
                      'Business',
                      style: TextStyle(color: Colors.black87, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  MyProfileScreen(),
                  BusinessProfileScreen(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
