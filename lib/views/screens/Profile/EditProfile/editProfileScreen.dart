import 'package:flutter/material.dart';
import 'package:prestar/views/screens/Profile/EditProfile/businessProfileScreen.dart';
import 'package:prestar/views/screens/Profile/EditProfile/myProfileScreen.dart';

import '../../../common_screens/NotificationScreen.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _changeTabControllerColor = true;
  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      print(_tabController.index);
      switch (_tabController.index) {
        case 0:
          setState(() {
            _changeTabControllerColor = true;
          });
          break;
        case 1:
          setState(() {
            _changeTabControllerColor = false;
          });
          break;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

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
            'Edit Profile',
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
          width: screenWidth,
          height: screenHeight,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.transparent,
                  // padding: EdgeInsets.all(10),
                  labelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  unselectedLabelStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  labelColor: Colors.indigo,
                  unselectedLabelColor: Colors.white,
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: EdgeInsets.only(left: 5, top: 2),
                      decoration: BoxDecoration(
                        color: _changeTabControllerColor
                            ? Colors.white
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'My Profile',
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: EdgeInsets.only(right: 5, top: 2),
                      decoration: BoxDecoration(
                        color: _changeTabControllerColor
                            ? Colors.transparent
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        'Business',
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    MyProfileScreen(),
                    BusinessProfileScreen(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
