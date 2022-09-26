import 'package:flutter/material.dart';

class Coffeetype extends StatelessWidget {
  final String coffeetype;
  final bool isSelected;
  final VoidCallback onTap;
  Coffeetype({required this.coffeetype, required this.isSelected,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeetype,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
