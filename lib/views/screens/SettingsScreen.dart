import 'package:flutter/material.dart';

import '../common_screens/NotificationScreen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController _textFieldController = new TextEditingController();
  TextEditingController _userPasswordFieldController =
      new TextEditingController();
  TextEditingController _confirmPasswordFieldController =
      new TextEditingController();
  FocusNode _confirmPasswordFocusNode = new FocusNode();
  late String userEmail;
  late String userPhone;

  bool _isNewPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _isNewPasswordValid = true;
  bool _isConfirmPasswordValid = true;
  String errorText = "Password cannot be empty";
  String errorText2 = "Password don\'t match";
  @override
  void initState() {
    super.initState();
    updateSettingsDetails();
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
              margin: EdgeInsets.only(top: 15),
              child: Text(
                'Change Password',
                style: TextStyle(color: Colors.black38, fontSize: 14),
              ),
              width: double.infinity,
            ),
            TextField(
              controller: _userPasswordFieldController,
              decoration: InputDecoration(
                hintText: 'New Password',
                hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                errorText: _isNewPasswordValid ? null : errorText,
                suffixIcon: IconButton(
                  icon: _isNewPasswordVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isNewPasswordVisible = !_isNewPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_isNewPasswordVisible,
              onChanged: (value) {
                setState(() {
                  _isNewPasswordValid = true;
                });
              },
              onEditingComplete: () {
                if (_userPasswordFieldController.text.trim() == "") {
                  setState(() {
                    _isNewPasswordValid = false;
                  });
                } else {
                  _confirmPasswordFocusNode.requestFocus();
                }
              },
            ),
            TextField(
              controller: _confirmPasswordFieldController,
              focusNode: _confirmPasswordFocusNode,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                hintStyle: TextStyle(color: Colors.black54, fontSize: 14),
                errorText: _isConfirmPasswordValid ? null : errorText2,
                suffixIcon: IconButton(
                  icon: _isConfirmPasswordVisible
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !_isConfirmPasswordVisible,
              onChanged: (value) {
                setState(() {
                  _isNewPasswordValid = true;
                });
              },
              onEditingComplete: () {
                _confirmPasswordFocusNode.unfocus();

                ///validate confirm password
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Phone No.',
                style: TextStyle(color: Colors.black38, fontSize: 14),
              ),
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userPhone,
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      InkWell(
                        child: Icon(Icons.edit),
                        onTap: () => updateUserPhone(),
                      )
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Email Address',
                style: TextStyle(color: Colors.black38, fontSize: 14),
              ),
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        userEmail,
                        style: TextStyle(color: Colors.black87, fontSize: 18),
                      ),
                      InkWell(
                        child: Icon(Icons.edit),
                        onTap: () => updateUserEmail(),
                      )
                    ],
                  ),
                  Divider()
                ],
              ),
            ),
            SizedBox(height: 30),
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

  void updateSettingsDetails() {
    setState(() {
      userEmail = "rimadutta1234@gmail.com";
      userPhone = "7872540396";
    });
  }

  updateUserPhone() {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: Text("Edit "),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Update "),
                TextField(
                  controller: _textFieldController,
                )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Okay"),
              )
            ],
          );
        });
  }

  updateUserEmail() {
    showDialog(
        context: context,
        builder: (context) {
          return new AlertDialog(
            title: Text("Edit "),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Update "),
                TextField(
                  controller: _textFieldController,
                )
              ],
            ),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text("Okay"),
              )
            ],
          );
        });
  }
}
