import 'package:flutter/material.dart';

class LikesScreen extends StatefulWidget {
  const LikesScreen({Key? key}) : super(key: key);

  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
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
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'People who liked this post',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile1.jpg"),
            ),
            title: Text(
              'Rima Dutta',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile2.jpg"),
            ),
            title: Text(
              'Rima Dutta',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile1.jpg"),
            ),
            title: Text(
              'Rima Dutta',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile2.jpg"),
            ),
            title: Text(
              'Rima Dutta',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile1.jpg"),
            ),
            title: Text(
              'Rima Dutta',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }
}
