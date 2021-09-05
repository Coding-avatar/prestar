import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prestar/views/screens/HomeScreen.dart';
import 'package:prestar/views/screens/RecoverPasswordScreen.dart';
import 'package:prestar/views/screens/RegisterScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailFieldController = new TextEditingController();
  TextEditingController mobileNumberFieldController =
      new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();

  FocusNode emailFocusNode = new FocusNode();
  FocusNode mobileNumberFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();

  void initState() {
    super.initState();
    Future.delayed(
      Duration(),
      () => SystemChannels.textInput.invokeMethod('TextInput.hide'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Text(
                  'Your Email',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                width: double.infinity,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailFieldController,
                focusNode: emailFocusNode,
                autofocus: true,
                onEditingComplete: () {
                  mobileNumberFocusNode.requestFocus();
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Enter your email',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
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
                onEditingComplete: () {
                  passwordFocusNode.requestFocus();
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone_android_outlined),
                  hintText: 'Enter your mobile number',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
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
                controller: passwordFieldController,
                focusNode: passwordFocusNode,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  suffixIcon: Icon(Icons.visibility),
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
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
                    onPressed: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    ),
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
    );
  }
}
