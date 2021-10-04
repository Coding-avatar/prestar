import 'package:flutter/material.dart';
import 'package:prestar/views/custom_widgets/imagePost.dart';

class UserPostScreen extends StatefulWidget {
  UserPostScreen({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  _UserPostScreenState createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  List posts = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: posts.length == 0
          ? Center(
              child: Text(
                'Sorry no Post to show',
                style: TextStyle(
                  color: Colors.black87,
                ),
              ),
            )
          : ListView.builder(
              itemCount: posts.length,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CircularProgressIndicator();
                //   ImagePost(
                //   imageUrl: '',
                // );
              }),
    );
  }

  void fetchPosts() {}
}
