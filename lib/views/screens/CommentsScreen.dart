import 'package:flutter/material.dart';

class CommentsScreen extends StatefulWidget {
  const CommentsScreen({Key? key}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff1eeee),
        title: Text(
          'People who comments',
          style: TextStyle(color: Colors.black54),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.indigo,
          ),
          onPressed: () => Navigator.of(context).pop(),
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
              'Mr Cat',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('hello friends'),
                Row(
                  children: [TextButton(onPressed: null, child: Text('Reply'))],
                )
              ],
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
            subtitle: Text('Hi'),
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
            subtitle: Text('hello friends'),
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
            subtitle: Text('hello friends'),
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
            subtitle: Text('hello friends'),
          ),
        ],
      ),
    );
  }
}
