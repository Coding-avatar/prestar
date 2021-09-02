import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailFieldController = new TextEditingController();
  TextEditingController mobileNumberFieldController = new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();

  FocusNode emailFocusNode = new FocusNode();
  FocusNode mobileNumberFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                child: Image.asset("assets/logo/prestar.png"),
                radius: 50,
                backgroundColor: Colors.blue,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailFieldController,
                focusNode: emailFocusNode,
                decoration: InputDecoration(prefixIcon: Icon(Icons.email_outlined),alignLabelWithHint: false,labelText: 'Your Email',labelStyle: TextStyle(color: Colors.grey,fontSize: 12),hintText: 'Enter your email',hintStyle: TextStyle(color: Colors.black54,fontSize: 16),),
              ),
              TextField(
                keyboardType: TextInputType.phone,
                controller: mobileNumberFieldController,
                focusNode: mobileNumberFocusNode,
                decoration: InputDecoration(prefixIcon: Icon(Icons.phone_android_outlined),alignLabelWithHint: false,labelText: 'Mobile No.',labelStyle: TextStyle(color: Colors.grey,fontSize: 12),hintText: 'Enter your mobile number',hintStyle: TextStyle(color: Colors.black54,fontSize: 16),),
              ),
              TextField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordFieldController,
                focusNode: passwordFocusNode,
                obscureText: true,
                decoration: InputDecoration(prefixIcon: Icon(Icons.lock_outline),suffixIcon: Icon(Icons.visibility),alignLabelWithHint: false,labelText: 'Password',labelStyle: TextStyle(color: Colors.grey,fontSize: 12),hintText: 'Enter your password',hintStyle: TextStyle(color: Colors.black54,fontSize: 16),),
              ),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: null,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Login'),
                      Icon(Icons.exit_to_app),
                    ],
                  ),
                ),
                width: double.infinity,
                height: 50,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: null,
                    child: Text('Forgot your password?',style: TextStyle(fontWeight: FontWeight.w500),),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text('Register Now',style: TextStyle(fontWeight: FontWeight.w500),),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.ac_unit_outlined),
                      SizedBox(width: 10,),
                      Text('Login with Google'),
                    ],
                  ),
                ),
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.ac_unit_outlined),
                      SizedBox(width: 10,),
                      Text('Login with Facebook'),
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
