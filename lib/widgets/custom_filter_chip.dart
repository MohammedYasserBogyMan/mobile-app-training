import 'package:flutter/material.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({
    super.key,
    required this.label,
    this.isSelected = false,
  });

  final String label;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 26),
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF2474D6) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? const Color(0xFF2474D6) : const Color(0xFFE6EAF1),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: isSelected ? Colors.white : const Color(0xFF2E3A4A),
        ),
      ),
    );
  }
}
