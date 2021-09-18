import 'package:flutter/material.dart';

import 'NotificationScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController userPasswordFieldController =
      new TextEditingController();
  TextEditingController confirmPasswordFieldController =
      new TextEditingController();
  TextEditingController userEmailFieldController = new TextEditingController();
  TextEditingController userMobileNumberFieldController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    updateDetails();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          'Account Settings',
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
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Change Password'),
              width: double.infinity,
            ),
            TextField(
              controller: userPasswordFieldController,
              decoration: InputDecoration(
                hintText: 'New Password',
                hintStyle: TextStyle(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility_off),
                  onPressed: null,
                ),
              ),
              obscureText: true,
            ),
            TextField(
              controller: confirmPasswordFieldController,
              decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility_off),
                    onPressed: null,
                  ),
                  alignLabelWithHint: false),
              obscureText: true,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Change Email'),
              width: double.infinity,
            ),
            TextField(
              controller: userEmailFieldController,
              decoration: InputDecoration(
                hintText: 'Email Address',
                hintStyle: TextStyle(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ),
              enabled: false,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text('Change Phone No.'),
              width: double.infinity,
            ),
            TextField(
              controller: userMobileNumberFieldController,
              decoration: InputDecoration(
                hintText: 'Phone No.',
                hintStyle: TextStyle(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
                // labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              enabled: true,
            ),
            Expanded(
              child: Container(),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Save Settings'),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  void updateDetails() {
    setState(() {
      userEmailFieldController.text = "rimadutta1234@gmail.com";
      userMobileNumberFieldController.text = "1234567890";
    });
  }
}
