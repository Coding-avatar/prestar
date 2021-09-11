import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prestar/views/screens/PostScreen.dart';
import 'package:prestar/views/widgets/CustomGenderRadioButton.dart';
import 'package:prestar/views/widgets/CustomLogoRadioButton.dart';

import 'HomeScreen.dart';
import 'ProfileScreen.dart';
import 'VideoPostScreen.dart';

class GoLiveDescriptionScreen extends StatefulWidget {
  const GoLiveDescriptionScreen({Key? key}) : super(key: key);

  @override
  _GoLiveDescriptionScreenState createState() =>
      _GoLiveDescriptionScreenState();
}

class _GoLiveDescriptionScreenState extends State<GoLiveDescriptionScreen> {
  String _groupValue = "Male";
  String _groupValue2 = "1";
  List<String> _logoList = [
    'assets/logo/test1.png',
    'assets/logo/test2.png',
    'assets/logo/test3.png',
    'assets/logo/test4.png',
    'assets/logo/test5.png',
    'assets/logo/test7.png',
    'assets/logo/test8.png',
    'assets/logo/test9.png',
    'assets/logo/test10.png',
  ];
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
        // actions: [
        //   IconButton(
        //     onPressed: null,
        //     icon: ImageIcon(
        //       AssetImage("assets/icons/bell.png"),
        //       color: Colors.black87,
        //     ),
        //   ),
        //   SizedBox(
        //     width: 15,
        //   )
        // ],
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Title',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    filled: true,
                    fillColor: Colors.white),
                maxLines: 2,
                maxLength: 50,
              ),
              Text(
                'Description',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    filled: true,
                    fillColor: Colors.white),
                maxLines: 3,
                maxLength: 150,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Gender',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomGenderRadioButton(
                      value: 'Male',
                      groupValue: _groupValue,
                      labelIcon: "assets/icons/bell.png",
                      onChanged: _valueChangedHandler(),
                      text: 'Male'),
                  CustomGenderRadioButton(
                      value: 'Female',
                      groupValue: _groupValue,
                      labelIcon: "assets/icons/bell.png",
                      onChanged: _valueChangedHandler(),
                      text: 'Female'),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CustomGenderRadioButton(
                        value: 'Both',
                        groupValue: _groupValue,
                        labelIcon: "assets/icons/bell.png",
                        onChanged: _valueChangedHandler(),
                        text: 'Both'),
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Logo',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Roboto'),
              ),
              GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1 / 1,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: _logoList.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  itemBuilder: (context, index) {
                    return CustomLogoRadioButton(
                        value: index.toString(),
                        groupValue: _groupValue2,
                        assetLocation: _logoList[index],
                        onChanged: _valueChangedHandler2());
                  }),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.indigo),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    child: Text(
                      'Start Live Video',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => HomeScreen(),
                ),
              );
              break;
            case 1:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => CreatePostScreen(),
                ),
              );
              break;
            case 2:
              break;
            case 3:
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => VideoPostScreen(),
                ),
              );
              break;
            case 4:
              Navigator.of(context).pushReplacement(
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

  ValueChanged<String?> _valueChangedHandler2() {
    return (value) => setState(() => _groupValue2 = value!);
  }

  ValueChanged<String?> _valueChangedHandler() {
    return (value) => setState(() => _groupValue = value!);
  }
}
