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
  bool _isLoading = false;
  List<AppUser> _followingList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    fetchUserFollowers();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width),
      child: _followingList.length == 0
          ? Center(
              child: _isLoading
                  ? Text('Sorry no followers to show')
                  : CircularProgressIndicator(),
            )
          : GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: _followingList.length,
              itemBuilder: (context, index) {
                return UserTile(
                    uid: _followingList[index].uid,
                    userPhotoUrl: _followingList[index].profile_pic ?? '',
                    userName: _followingList[index].name,
                    userLocation: _followingList[index].location ?? '');
              }),
    );
  }

  void fetchUserFollowers() {
    /// Dummy Data
    setState(() {
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
      _followingList.add(AppUser(
          uid: "123456",
          name: "Rahul Ghosh",
          location: 'Dum Dum',
          email: 'rahulghosh123@gmail.com'));
    });
  }
}
