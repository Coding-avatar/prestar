import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              FormText(
                textValue: 'Your Email',
              ),
              SizedBox(
                height: 10,
              ),
              TextField(),
              SizedBox(
                height: 20,
              ),
              FormText(
                textValue: 'Mobile No.',
              ),
              SizedBox(
                height: 10,
              ),
              TextField(),
              SizedBox(
                height: 20,
              ),
              FormText(
                textValue: 'Password',
              ),
              SizedBox(
                height: 10,
              ),
              TextField(),
              SizedBox(
                height: 50,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Login'),
                ),
                width: double.infinity,
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
                    child: Text('Forgot your password'),
                  ),
                  TextButton(
                    onPressed: null,
                    child: Text('Register Now'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Login with Google'),
                ),
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: ElevatedButton(
                  onPressed: null,
                  child: Text('Login with Facebook'),
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

class FormText extends StatelessWidget {
  final String textValue;
  const FormText({
    Key? key,
    required this.textValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        textValue,
        style: TextStyle(
            color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
      ),
    );
  }
}
