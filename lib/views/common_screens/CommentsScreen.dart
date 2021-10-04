import 'package:flutter/material.dart';
import 'package:prestar/models/api_models/posts.dart';

class CommentsScreen extends StatefulWidget {
  final List<Comments> comments;
  CommentsScreen({Key? key, required this.comments}) : super(key: key);

  @override
  _CommentsScreenState createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  late List<Comments> comments;
  @override
  void initState() {
    super.initState();
    comments = widget.comments;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff1eeee),
        title: Text(
          'Comments',
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
      body: comments.length == 0
          ? Container(
              height: screenHeight,
              width: screenWidth,
              alignment: Alignment.center,
              child: Text('No Comments to show'),
            )
          : ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        NetworkImage(comments[index].authorProfileImage),
                  ),
                  title: Text(
                    comments[index].authorName,
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black87,
                        fontWeight: FontWeight.w700),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(comments[index].message),
                      Row(
                        children: [
                          TextButton(
                            onPressed: null,
                            child: Text('Reply'),
                            style: ButtonStyle(
                                padding:
                                    MaterialStateProperty.all(EdgeInsets.zero)),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
