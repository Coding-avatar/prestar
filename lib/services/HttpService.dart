import 'dart:convert';

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
    print('Login user response: ${res.body}');
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

    print('Register User Response: ${res.body}');
    return res;
  }

  Future<List<double>> getCurrentLocation() async {
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      var position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      var coordinates = [position.latitude, position.longitude];
      return coordinates;
    }
    return [];
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

    print('Register User Response: ${res.body}');
    return res;
  }

  Future<http.Response> fetchAllPostOfUser({required String uid}) async {
    http.Response res = await http.get(
      Uri.parse(ApiConstants.Base_url + "/users/$uid/posts"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Fetch all post of user Response: ${res.body}');
    return res;
  }

  Future<http.Response> fetchUserDetails({required String uid}) async {
    http.Response res = await http.get(
      Uri.parse(ApiConstants.Base_url + "/users/$uid"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Fetch user details Response: ${res.body}');
    return res;
  }

  Future<http.Response> createPost({
    required String uid,
  }) async {
    http.Response res = await http.get(
      Uri.parse(ApiConstants.Base_url + "/users/$uid"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    print('Fetch user details Response: ${res.body}');
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
