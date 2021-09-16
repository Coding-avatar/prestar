import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
