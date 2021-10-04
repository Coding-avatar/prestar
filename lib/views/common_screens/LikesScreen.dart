import 'package:flutter/material.dart';
import 'package:prestar/models/api_models/posts.dart';

class LikesScreen extends StatefulWidget {
  final List<Likes> likes;
  LikesScreen({Key? key, required this.likes}) : super(key: key);

  @override
  _LikesScreenState createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  late List<Likes> likes;
  @override
  void initState() {
    super.initState();
    likes = widget.likes;
  }

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
          'Likes',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: likes.length == 0
          ? Container(
              height: screenHeight,
              width: screenWidth,
              alignment: Alignment.center,
              child: Text('No Likes to show'),
            )
          : ListView.builder(
              itemCount: likes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(likes[index].authorProfileImage),
                  ),
                  title: Text(
                    likes[index].authorName,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700),
                  ),
                );
              },
            ),
    );
  }
}
