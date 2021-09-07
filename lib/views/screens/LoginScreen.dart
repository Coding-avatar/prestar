import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prestar/views/screens/HomeScreen.dart';
import 'package:prestar/views/screens/RecoverPasswordScreen.dart';
import 'package:prestar/views/screens/RegisterOtpScreen.dart';
import 'package:prestar/views/screens/RegisterScreen.dart';
import 'package:prestar/views/widgets/errorDialog.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController mobileNumberFieldController =
      new TextEditingController();

  FocusNode mobileNumberFocusNode = new FocusNode();

  bool _isPhoneNumberValid = true;
  String errorText = "Please Enter a valid phone number";

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(),
      () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    );
  }

  @override
  void dispose() { 
    super.dispose();
    mobileNumberFieldController.dispose();
    mobileNumberFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                CircleAvatar(
                  child: Image.asset(
                    "assets/logo/prestar_small_logo.png",
                    width: 70,
                    height: 70,
                    color: Colors.white,
                  ),
                  radius: 50,
                  backgroundColor: Color(0xff092497),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Text(
                    'Mobile No.',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  width: double.infinity,
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  controller: mobileNumberFieldController,
                  focusNode: mobileNumberFocusNode,
                  autofocus: true,
                  onChanged: (value) {
                    setState(() {
                      _isPhoneNumberValid = true;
                    });
                  },
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(10),
                    FilteringTextInputFormatter.allow(
                      RegExp(r'^[0-9]*'),
                    ),
                  ],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    hintText: 'Enter your mobile number',
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
                    errorText: _isPhoneNumberValid ? null : errorText,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff092497), Colors.black87],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xff000000),
                              blurRadius: 5.0,
                              offset: Offset(1, 3)),
                        ]),
                    child: ElevatedButton(
                      onPressed: () => signInWithPhoneNumber(),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16),
                            ),
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  width: double.infinity,
                  height: 55,
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RecoverPasswordScreen(),
                        ),
                      ),
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      ),
                      child: Text(
                        'Register Now',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/icons/google.png"),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Login with Google',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  width: double.infinity,
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blueAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/icons/facebook.png"),
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Login with Facebook',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  signInWithPhoneNumber() async {
    String phoneNumber = mobileNumberFieldController.text;
    if (phoneNumber.length == 10 &&
        (phoneNumber.startsWith('6') ||
            phoneNumber.startsWith('7') ||
            phoneNumber.startsWith('8') ||
            phoneNumber.startsWith('9'))) {
      print('Valid Mobile Number');
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => RegisterOtpScreen(
                userMobileNumber: phoneNumber,
              )));
    } else {
      print('Invalid phone number');
      setState(() {
        _isPhoneNumberValid = false;
      });
    }
  }
}
