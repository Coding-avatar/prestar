import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String titleText;
  final String errorMessage;
  const ErrorDialog({required this.titleText, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 10,
      backgroundColor: Colors.white,
      child: Container(
        child: Column(
          children: [
            Text(titleText),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 30,
            ),
            SizedBox(
              height: 10,
            ),
            Text(errorMessage)
          ],
        ),
      ),
    );
  }
}
