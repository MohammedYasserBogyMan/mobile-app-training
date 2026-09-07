import 'package:flutter/material.dart';

class TaskActions extends StatelessWidget {
  const TaskActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 46,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF2474D6),
              backgroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFFD6E2F1)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            child: const Text('تعديل المهمة'),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 46,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: const Color(0xFF2474D6),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
            child: const Text('إكمال المهمة'),
          ),
        ),
      ],
    );
  }
}
