import 'package:flutter/material.dart';

class TaskDetailsHeader extends StatelessWidget {
  const TaskDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.pop(context);
          },
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Icon(
              Icons.chevron_right,
              size: 22,
              color: Color(0xFF2E3A4A),
            ),
          ),
        ),
        const SizedBox(width: 4),
        const Text(
          'تفاصيل المهمة',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w800,
            color: Color(0xFF2E3A4A),
          ),
        ),
      ],
    );
  }
}
