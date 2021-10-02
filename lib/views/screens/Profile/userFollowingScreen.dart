import 'package:flutter/material.dart';
import 'package:prestar/views/custom_widgets/userTile.dart';
import 'package:prestar/models/userModel.dart';

class UserFollowingScreen extends StatefulWidget {
  const UserFollowingScreen({Key? key, required this.uid}) : super(key: key);
  final String uid;
  @override
  _UserFollowingScreenState createState() => _UserFollowingScreenState();
}

class _UserFollowingScreenState extends State<UserFollowingScreen> {
  List<AppUser> followingList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    fetchUserFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: followingList.length,
          itemBuilder: (context, index) {
            return UserTile(
                uid: followingList[index].uid,
                userPhotoUrl: followingList[index].profile_pic ?? '',
                userName: followingList[index].name,
                userLocation: followingList[index].location ?? '');
          }),
    );
  }

  void fetchUserFollowers() {
    /// Dummy Data
    setState(() {
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
    });
  }
}
