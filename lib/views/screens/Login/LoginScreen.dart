import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prestar/services/auth_provider.dart';
import 'package:prestar/views/screens/Home/HomeScreen.dart';
import 'package:prestar/views/screens/RecoverPasswordScreen.dart';
import 'package:prestar/views/screens/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userIdFieldController = new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();

  FocusNode userIdFocusNode = new FocusNode();
  FocusNode passwordFieldFocusNode = new FocusNode();

  bool _isPhoneNumberValid = false;
  String errorText = "Please Enter a valid phone number";
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    //method to hide keyboard on startup
    Future.delayed(
      Duration(),
      () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    );
  }

  @override
  void dispose() {
    super.dispose();
    userIdFieldController.dispose();
    userIdFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Container(
            width: _screenWidth,
            height: _screenHeight,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "assets/logo/prestarold.png",
                    width: _screenWidth * .5,
                    // height: 70,
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Container(
                    child: Text(
                      'Email / Mobile No.',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    width: double.infinity,
                  ),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    controller: userIdFieldController,
                    focusNode: userIdFocusNode,
                    autocorrect: false,
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
                      hintText: 'Enter your email id or mobile number',
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
                      errorText: _isPhoneNumberValid ? null : errorText,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    width: double.infinity,
                  ),
                  TextField(
                    keyboardType: TextInputType.visiblePassword,
                    textInputAction: TextInputAction.go,
                    controller: passwordFieldController,
                    focusNode: passwordFieldFocusNode,
                    autofocus: false,
                    autocorrect: false,
                    onChanged: (value) {
                      print(value);
                    },
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: IconButton(
                        icon: _isPasswordVisible
                            ? Icon(Icons.visibility_off)
                            : Icon(Icons.visibility),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                      hintText: 'Enter your password',
                      hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
                      errorText: null,
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                              offset: Offset(1, 3),
                            ),
                          ]),
                      child: ElevatedButton(
                        onPressed: () {
                          /// Add method to find user email and login with email and password
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
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
                      onPressed: () => _signInWithGoogle(),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.redAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  height: _screenWidth * .5,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Sign Up with Facebook',
                                        style: TextStyle(
                                            color: Colors.indigo, fontSize: 22),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.indigo,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Image.asset(
                                          "assets/icons/facebook.png",
                                          fit: BoxFit.fill,
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Coming Soon',
                                        style: TextStyle(
                                            color: Colors.indigoAccent,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
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
      ),
    );
  }

  // signInWithPhoneNumber() async {
  //   String phoneNumber = mobileNumberFieldController.text;
  //   if (phoneNumber.length == 10 &&
  //       (phoneNumber.startsWith('6') ||
  //           phoneNumber.startsWith('7') ||
  //           phoneNumber.startsWith('8') ||
  //           phoneNumber.startsWith('9'))) {
  //     print('Valid Mobile Number');
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (context) => RegisterOtpScreen(
  //               userMobileNumber: phoneNumber,
  //             )));
  //   } else {
  //     print('Invalid phone number');
  //     setState(() {
  //       _isPhoneNumberValid = false;
  //     });
  //   }
  // }

  Future<void> _signInWithGoogle() async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  Future<bool> _onBackPressed() async {
    return (await showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Confirm Exit?'),
                content: Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    child: Text('No'),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  TextButton(
                    child: Text('Yes'),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            })) ??
        false;
  }
}
