import 'package:flutter/material.dart';
import 'package:prestar/views/custom_widgets/userTile.dart';
import 'package:prestar/models/userModel.dart';

class UserFollowersScreen extends StatefulWidget {
  const UserFollowersScreen({Key? key, required this.uid}) : super(key: key);
  final String uid;
  @override
  _UserFollowersScreenState createState() => _UserFollowersScreenState();
}

class _UserFollowersScreenState extends State<UserFollowersScreen> {
  List<AppUser> followerList = List.empty(growable: true);

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
          itemCount: followerList.length,
          itemBuilder: (context, index) {
            return UserTile(
                uid: followerList[index].uid,
                userPhotoUrl: followerList[index].profile_pic ?? '',
                userName: followerList[index].name,
                userLocation: followerList[index].location ?? '');
          }),
    );
  }

  void fetchUserFollowers() {
    ///Dummy Data
    setState(() {
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      followerList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
    });
  }
}
