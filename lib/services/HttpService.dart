import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:prestar/constants/api_constants.dart';
import 'package:prestar/models/api_models/mongoUser.dart';

class HttpService {
  Future<http.Response> findUserWithEmail({required String email}) async {
    http.Response res =
        await http.post(Uri.parse(ApiConstants.endpointLoginUser),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({"email": email}));
    // print('Login user response: ${res.body}');
    return res;
  }

  Future<http.Response> findUser({required String uid}) async {
    http.Response res = await http.get(
        Uri.parse(ApiConstants.Base_url + '/users/$uid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    print('Find user response: ${res.body}');
    return res;
  }

  Future<http.Response> registerUserWithEmailAndPassword({
    required String email,
    required String name,
    bool emailIsVerified = false,
    bool usedEmailAuth = false,
    bool usedGoogleAuth = false,
    String phone = "",
  }) async {
    http.Response res =
        await http.post(Uri.parse(ApiConstants.endpointRegisterUser),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "name": name,
              "email": email,
              "phone": phone,
            }));

    // print('Register User Response: ${res.body}');
    return res;
  }

  Future<UserLocation> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
    }
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemark[0];
      return UserLocation(
          type: "Point",
          coordinates: [position.latitude, position.longitude],
          address: place.subLocality!,
          description: place.street!);
    }
    return UserLocation(
        type: "Point", coordinates: [], address: '', description: '');
  }

  Future<http.Response> registerUserWithGoogle({
    required String email,
    required String name,
    bool emailIsVerified = false,
    bool usedEmailAuth = false,
    bool usedGoogleAuth = false,
  }) async {
    http.Response res =
        await http.post(Uri.parse(ApiConstants.endpointRegisterUser),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              "name": name,
              "email": email,
              "emailIsVerified": true,
              "usedGoogleAuth": true,
              "location": {
                "type": "Point",
                "coordinates": await getCurrentLocation()
              }
            }));

    // print('Register User Response: ${res.body}');
    return res;
  }

  Future<http.Response> fetchAllPostOfUser({required String uid}) async {
    http.Response res = await http.get(
      Uri.parse(ApiConstants.Base_url + "/users/$uid/posts"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // print('Fetch all post of user Response: ${res.body}');
    return res;
  }

  Future<http.Response> fetchUserDetails({required String uid}) async {
    http.Response res = await http.get(
      Uri.parse(ApiConstants.Base_url + "/users/$uid"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    // print('Fetch user details Response: ${res.body}');
    return res;
  }

  Future<http.Response> fetchAllUsers() async {
    http.Response res = await http.get(
      Uri.parse(ApiConstants.Base_url + "/users"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print('Fetch All Users Response: ${res.body}');
    return res;
  }

  Future<http.Response> createPost(
      {required String uid,
      required String name,
      required String postTitle,
      required String contentType,
      required String url,
      required String target}) async {
    http.Response res = await http.post(Uri.parse(ApiConstants.createPost),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          "authorId": uid,
          "authorName": name,
          "title": postTitle,
          "contentType": contentType,
          "mediaUrl": url,
          "targetAudience": target,
          "contentCategories": [postTitle],
        }));

    print('Create Post Response: ${res.body}');
    return res;
  }

  Future<http.Response> fetchAllPost() async {
    http.Response res = await http.get(
      Uri.parse(ApiConstants.fetchAllPost),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    // print('Fetch all post Response: ${res.body}');
    return res;
  }
}
