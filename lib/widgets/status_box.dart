import 'package:flutter/material.dart';

class StatusBox extends StatelessWidget {
  const StatusBox({super.key, required this.isCompleted});

  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCompleted ? const Color(0xFFE7F6EC) : const Color(0xFFE8F3FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isCompleted
          ? const Icon(Icons.check, size: 16, color: Color(0xFF34A853))
          : Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF2474D6),
                shape: BoxShape.circle,
              ),
            ),
    );
  }
}
