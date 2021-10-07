import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  UserTile(
      {Key? key,
      required this.uid,
      required this.userPhotoUrl,
      required this.userName,
      required this.userLocation})
      : super(key: key);
  final String uid;
  final String userPhotoUrl;
  final String userName;
  final String userLocation;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Card(
      color: Color(0xff092497),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        width: screenWidth / 2.3,
        height: screenWidth / 2.4,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 32,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(userPhotoUrl),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              '$userName',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              userLocation,
              style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
