import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:prestar/constants/shared_preference_constants.dart';
import 'package:prestar/models/api_models/mongoUser.dart';
import 'package:prestar/services/HttpService.dart';
import 'package:prestar/views/custom_widgets/errorDialog.dart';
import 'package:prestar/views/custom_widgets/userTile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserFollowersScreen extends StatefulWidget {
  const UserFollowersScreen({Key? key, required this.uid}) : super(key: key);
  final String uid;
  @override
  _UserFollowersScreenState createState() => _UserFollowersScreenState();
}

class _UserFollowersScreenState extends State<UserFollowersScreen> {
  bool _isLoading = false;
  List<MongoUser> _followerList = List.empty(growable: true);
  List<String> followers = List.empty(growable: true);
  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        followers = prefs.getStringList(Constants.MongoUserFollowers)!;
      });
      fetchUserFollowers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width),
      child: _followerList.length == 0
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
              itemCount: _followerList.length,
              itemBuilder: (context, index) {
                return UserTile(
                    uid: _followerList[index].sId,
                    userPhotoUrl: _followerList[index].profileImage,
                    userName: _followerList[index].name,
                    userLocation: _followerList[index].location!.address);
              }),
    );
  }

  void fetchUserFollowers() {
    print('into fetch followers block');
    setState(() {
      _isLoading = true;
    });
    HttpService().fetchAllUsers().then((res) {
      if (res.statusCode == 200) {
        var responseJSON = jsonDecode(res.body);
        responseJSON.forEach((element) {
          MongoUser user = MongoUser.fromJson(element);
          if (followers.contains(user.sId)) {
            _followerList.add(user);
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
