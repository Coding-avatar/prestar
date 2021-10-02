import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:prestar/constants/api_constants.dart';

class HttpService {
  Future<http.Response> registerUser({
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
}
