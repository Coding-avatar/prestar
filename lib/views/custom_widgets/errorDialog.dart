import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  final String titleText;
  final String errorMessage;
  const ErrorDialog({required this.titleText, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        width: MediaQuery.of(context).size.width * .7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titleText,
              style: TextStyle(color: Colors.black87, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              errorMessage,
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Text(
                  'Close',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dialog(
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(15),
// ),
// elevation: 10,
// backgroundColor: Colors.white,
// child: Container(
// child: Column(
// children: [
// Text(titleText),
// SizedBox(
// height: 10,
// ),
// Icon(
// Icons.error_outline,
// color: Colors.red,
// size: 30,
// ),
// SizedBox(
// height: 10,
// ),
// Text(errorMessage)
// ],
// ),
// ),
// )
