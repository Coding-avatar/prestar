import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
// import 'package:prestar/views/screens/HomeScreen.dart';

class RegisterOtpScreen extends StatefulWidget {
  final String userMobileNumber;
  const RegisterOtpScreen({Key? key, required this.userMobileNumber})
      : super(key: key);

  @override
  _RegisterOtpScreenState createState() => _RegisterOtpScreenState();
}

class _RegisterOtpScreenState extends State<RegisterOtpScreen> {
  String userMobileNumber = '71*****892';
  late String verId;
  bool codeSent = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      userMobileNumber = widget.userMobileNumber;
    });
    verifyPhone();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: screenWidth,
          height: screenHeight,
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 70,
              ),
              Text(
                'We have sent an OTP to your Mobile',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54, fontSize: 28),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please check your mobile number ${userMobileNumber.substring(0, 2) + '*****' + userMobileNumber.substring(7)} verification OTP',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                child: OTPTextField(
                  length: 6,
                  fieldWidth: 40,
                  style: TextStyle(fontSize: 16),
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldStyle: FieldStyle.box,
                  onChanged: (pin) {
                    // print(pin);
                  },
                  onCompleted: (pin) {
                    verifyOTP(pin);
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // verifyOTP(pin);
                    // Navigator.of(context).pop();
                    // Navigator.of(context).pushReplacement(
                    //   MaterialPageRoute(
                    //     builder: (context) => HomeScreen(),
                    //   ),
                    // );
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xff092497)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Next',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Didn\'t Receive? ',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        color: Color(0xff092497),
                      ),
                    ),
                    Text(
                      'Click Here',
                      style: TextStyle(
                          color: Color(0xff092497),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91 $userMobileNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          // handle error here
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            codeSent = true;
            verId = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          setState(() {
            verId = verificationId;
          });
        },
        timeout: Duration(seconds: 60));
  }

  void verifyOTP(String pin) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: pin);
    try {
      var user = await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }
}
