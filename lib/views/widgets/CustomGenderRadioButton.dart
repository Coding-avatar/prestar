import 'package:flutter/material.dart';

class CustomGenderRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String labelIcon;
  final String text;
  final ValueChanged<T?> onChanged;

  const CustomGenderRadioButton({
    required this.value,
    required this.groupValue,
    required this.labelIcon,
    required this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return Container(
      child: Row(
        children: [
          ImageIcon(
            AssetImage(labelIcon),
            color: isSelected ? Colors.indigo : Colors.black38,
            size: 26,
          ),
          SizedBox(
            width: 5,
          ),
          ElevatedButton(
            onPressed: () => onChanged(value),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  isSelected ? Colors.indigo : Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              elevation: MaterialStateProperty.all(5),
            ),
            child: Text(
              text,
              style:
                  TextStyle(color: isSelected ? Colors.white : Colors.black38),
            ),
          ),
        ],
      ),
    );
  }
}
