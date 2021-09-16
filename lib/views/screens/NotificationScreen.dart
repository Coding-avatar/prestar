import 'package:flutter/material.dart';
import 'package:prestar/views/widgets/NotificationTile.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff1eeee),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.indigo,
            size: 25,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            NotificationTile(
                userName: "Riya Karmakar",
                notificationMessage: " is following you",
                notificationTime: "03:45 PM",
                userImage:
                    "https://images.pexels.com/videos/1526909/pictures/preview-0.jpg"),
            SizedBox(
              height: 10,
            ),
            NotificationTile(
                userName: "Riya Dutta",
                notificationMessage: " is following you",
                notificationTime: "03:55 PM",
                userImage:
                    "https://images.pexels.com/videos/1510090/pictures/preview-0.jpg"),
            SizedBox(
              height: 10,
            ),
            NotificationTile(
                userName: "Amit Malakar",
                notificationMessage: " is following you",
                notificationTime: "04:20 PM",
                userImage:
                    "https://images.pexels.com/videos/1494284/pictures/preview-0.jpg"),
            SizedBox(
              height: 10,
            ),
            NotificationTile(
                userName: "Sujoy Biswas",
                notificationMessage: " is following you",
                notificationTime: "04:59 PM",
                userImage:
                    "https://images.pexels.com/videos/856973/pictures/preview-0.jpg"),
            SizedBox(
              height: 10,
            ),
            NotificationTile(
                userName: "Rashi Dasgupta",
                notificationMessage: " is following you",
                notificationTime: "05:12 PM",
                userImage:
                    "https://images.pexels.com/photos/9229072/pexels-photo-9229072.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"),
            SizedBox(
              height: 10,
            ),
            NotificationTile(
                userName: "Dita Dey",
                notificationMessage: " is following you",
                notificationTime: "05:22 PM",
                userImage:
                    "https://images.pexels.com/photos/9266627/pexels-photo-9266627.jpeg?auto=compress&cs=tinysrgb&fit=crop&h=627&w=1200"),
          ],
        ),
      ),
    );
  }
}
