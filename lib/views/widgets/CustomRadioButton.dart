import 'package:flutter/material.dart';

class CustomRadioButton extends StatefulWidget {
  const CustomRadioButton({Key? key}) : super(key: key);

  @override
  _CustomRadioButtonState createState() => _CustomRadioButtonState();
}

class _CustomRadioButtonState extends State<CustomRadioButton> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: null, child: Text(''));
  }
}
