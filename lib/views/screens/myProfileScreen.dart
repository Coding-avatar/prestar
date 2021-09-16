import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController userNameFieldController = new TextEditingController();
  TextEditingController userBioFieldController = new TextEditingController();
  TextEditingController userAgeFieldController = new TextEditingController();
  TextEditingController userLocationFieldController =
      new TextEditingController();
  TextEditingController userEmailFieldController = new TextEditingController();
  TextEditingController userMobileNumberFieldController =
      new TextEditingController();
  @override
  void initState() {
    super.initState();
    updateProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: AssetImage("assets/images/profile2.jpg"),
            ),
            TextField(
              controller: userNameFieldController,
              decoration: InputDecoration(
                label: Text('Name'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ),
              enabled: false,
            ),
            TextField(
              controller: userBioFieldController,
              decoration: InputDecoration(
                label: Text('Bio'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ),
              maxLines: 2,
              enabled: false,
              maxLength: 120,
            ),
            TextField(
              controller: userAgeFieldController,
              decoration: InputDecoration(
                label: Text('Age'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ),
              enabled: false,
            ),
            TextField(
              controller: userLocationFieldController,
              decoration: InputDecoration(
                label: Text('Location'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ),
              enabled: false,
            ),
            TextField(
              controller: userEmailFieldController,
              decoration: InputDecoration(
                label: Text('Email Address'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
              ),
              enabled: false,
            ),
            TextField(
              controller: userMobileNumberFieldController,
              decoration: InputDecoration(
                label: Text('Phone No.'),
                suffixIcon: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: null,
                ),
                // labelStyle: TextStyle(color: Colors.black54, fontSize: 12),
              ),
              enabled: true,
            ),
            // Date Of Birth
            // Gender
            // Interests
          ],
        ),
      ),
    );
  }

  void updateProfileDetails() {
    setState(() {
      userNameFieldController.text = "Rima Dutta";
      userBioFieldController.text =
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard";
      userAgeFieldController.text = "27";
      userLocationFieldController.text = "Kolkata";
      userEmailFieldController.text = "rimadutta1234@gmail.com";
      userMobileNumberFieldController.text = "1234567890";
    });
  }
}
