import 'package:flutter/material.dart';
import 'package:prestar/views/custom_widgets/videoPost.dart';

class UserVideosScreen extends StatefulWidget {
  UserVideosScreen({Key? key, required this.uid}) : super(key: key);
  final String uid;

  @override
  _UserVideosScreenState createState() => _UserVideosScreenState();
}

class _UserVideosScreenState extends State<UserVideosScreen> {
  // fetch user videos list from firebase
  List videos = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    fetchUserVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: ListView.builder(
          itemCount: videos.length,
          shrinkWrap: true,
          physics: AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return VideoPost();
          }),
    );
  }

  void fetchUserVideos() {}
}
