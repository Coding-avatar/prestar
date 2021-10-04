import 'package:flutter/material.dart';
import 'package:prestar/services/HttpService.dart';
import 'package:prestar/services/auth_provider.dart';
import 'package:prestar/views/custom_widgets/errorDialog.dart';
import 'package:prestar/views/screens/Login/LoginScreen.dart';
import 'package:prestar/views/screens/Registration/RegisterOtpScreen.dart';

import 'package:prestar/views/screens/Home/HomeScreen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isFormEnabled = true;

  String get email => emailFieldController.text.trim();
  String get password => passwordFieldController.text;
  String get name => nameFieldController.text.trim();
  String get phone => mobileNumberFieldController.text.trim();
  TextEditingController emailFieldController = new TextEditingController();
  TextEditingController nameFieldController = new TextEditingController();
  TextEditingController mobileNumberFieldController =
      new TextEditingController();
  TextEditingController passwordFieldController = new TextEditingController();
  TextEditingController birthdayFieldController = new TextEditingController();

  FocusNode emailFocusNode = new FocusNode();
  FocusNode nameFocusNode = new FocusNode();
  FocusNode mobileNumberFocusNode = new FocusNode();
  FocusNode passwordFocusNode = new FocusNode();
  FocusNode birthdayFocusNode = new FocusNode();

  String emailErrorText = "Please enter a valid email";
  String nameErrorText = "Name cannot be empty";
  String mobileNumberErrorText = "Please enter a valid mobile number";
  String passwordErrorText = "Password must be of minimum 6 characters";
  String birthdayErrorText = "Enter a valid Date of Birth";

  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedDate = DateTime.now();
      birthdayFieldController.text = _selectedDate.toString();
    });
  }

  void dispose() {
    super.dispose();
    emailFieldController.dispose();
    nameFieldController.dispose();
    mobileNumberFieldController.dispose();
    passwordFieldController.dispose();
    birthdayFieldController.dispose();

    emailFocusNode.dispose();
    nameFocusNode.dispose();
    mobileNumberFocusNode.dispose();
    passwordFocusNode.dispose();
    birthdayFocusNode.dispose();
  }

  //Method for showing the date picker
  void _pickDateDialog() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            //which date will display when user open the picker
            firstDate: DateTime(1950),
            //what will be the previous supported year in picker
            lastDate: DateTime
                .now()) //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        return;
      }
      setState(() {
        //for rebuilding the ui
        _selectedDate = pickedDate;

        ///format date for right use
        birthdayFieldController.text = _selectedDate.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
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
                Container(
                  child: Text(
                    'Full Name',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  width: double.infinity,
                ),
                TextField(
                  keyboardType: TextInputType.text,
                  controller: nameFieldController,
                  focusNode: nameFocusNode,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person_outline),
                    // suffixIcon: Icon(Icons.assign),
                    hintText: 'Enter your name',
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
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
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone_android_outlined),
                    alignLabelWithHint: false,
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
                    alignLabelWithHint: false,
                    hintText: 'Choose password',
                    hintStyle: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Date of Birth',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  width: double.infinity,
                ),
                TextField(
                  keyboardType: TextInputType.datetime,
                  controller: birthdayFieldController,
                  // focusNode: birthdayFocusNode,
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: _pickDateDialog,
                      icon: Icon(Icons.calendar_today),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    'Gender',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                  width: double.infinity,
                ),
                DropdownButton(
                  value: 'Choose you Gender',
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  onChanged: (String? newValue) {
                    // setState(() {
                    //   dropdownValue = newValue!;
                    // });
                  },
                  items: ['Choose you Gender', 'Male', 'Female', 'Other']
                      .map(
                        (item) => DropdownMenuItem(
                          child: Container(
                            width: _screenWidth - 64,
                            child: Row(
                              children: [
                                Icon(Icons.male, color: Colors.black54),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  item,
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          value: item,
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () async {
                      final auth = AuthProvider.of(context);
                      var user = await auth.createUserWithEmailAndPassword(
                          email, password);
                      if (user != null) {
                        HttpService()
                            .registerUserWithEmailAndPassword(
                                email: email, name: name, phone: phone)
                            .then((value) => null);
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorDialog(
                                titleText: "Registration failed",
                                errorMessage: "Registration Failed",
                              );
                            });
                      }
                      Navigator.of(context).popUntil((route) => route.isFirst);
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
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Register',
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
                  width: double.infinity,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () => _signInWithGoogle(),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.redAccent),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
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
                                        borderRadius: BorderRadius.circular(10),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
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

  Future<void> _signInWithGoogle() async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signInWithGoogle();
    } catch (e) {
      print(e.toString());
    }
  }

  void submit() {}
}
