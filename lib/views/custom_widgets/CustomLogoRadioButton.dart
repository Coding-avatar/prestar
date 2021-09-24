import 'package:flutter/material.dart';

class CustomLogoRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String assetLocation;
  final ValueChanged<T?> onChanged;

  const CustomLogoRadioButton({
    required this.value,
    required this.groupValue,
    required this.assetLocation,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final bool isSelected = value == groupValue;
    return InkWell(
      onTap: () => onChanged(value),
      child: Card(
        color: Colors.white,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
              color: isSelected ? Colors.indigo : Colors.white, width: 4),
        ),
        child: Image.asset(
          assetLocation,
        ),
      ),
    );
  }
}
