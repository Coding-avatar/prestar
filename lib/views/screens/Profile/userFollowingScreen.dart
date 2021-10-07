import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prestar/constants/shared_preference_constants.dart';
import 'package:prestar/models/api_models/mongoUser.dart';
import 'package:prestar/services/HttpService.dart';
import 'package:prestar/views/custom_widgets/errorDialog.dart';
import 'package:prestar/views/custom_widgets/userTile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserFollowingScreen extends StatefulWidget {
  const UserFollowingScreen({Key? key, required this.uid}) : super(key: key);
  final String uid;
  @override
  _UserFollowingScreenState createState() => _UserFollowingScreenState();
}

class _UserFollowingScreenState extends State<UserFollowingScreen> {
  bool _isLoading = false;
  List<MongoUser> _followingList = List.empty(growable: true);
  List<String> following = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        following = prefs.getStringList(Constants.MongoUserFollowing)!;
      });
      fetchUserFollowing();
    });
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
                    uid: _followingList[index].sId,
                    userPhotoUrl: _followingList[index].profileImage,
                    userName: _followingList[index].name,
                    userLocation: _followingList[index].location!.address);
              }),
    );
  }

  void fetchUserFollowing() {
    setState(() {
      _isLoading = true;
    });
    HttpService().fetchAllUsers().then((res) {
      if (res.statusCode == 200) {
        var responseJSON = jsonDecode(res.body);
        responseJSON.forEach((element) {
          MongoUser user = MongoUser.fromJson(element);
          if (following.contains(user.sId)) {
            _followingList.add(user);
          }
        });
        setState(() {
          _isLoading = false;
        });
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return ErrorDialog(
                  titleText: 'Network Error',
                  errorMessage: "Something went wrong");
            });
      }
      setState(() {
        _isLoading = false;
      });
    });
  }
}
