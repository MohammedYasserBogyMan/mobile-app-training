import 'package:flutter/material.dart';
import 'package:task_flow/models/task.dart';

class TaskSummary extends StatelessWidget {
  const TaskSummary({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task.title,
          style: const TextStyle(
            fontSize: 26,
            height: 1.2,
            fontWeight: FontWeight.w900,
            color: Color(0xFF172435),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          task.description,
          style: const TextStyle(
            fontSize: 12,
            height: 1.7,
            fontWeight: FontWeight.w600,
            color: Color(0xFF9AA5B4),
          ),
        ),
      ],
    );
  }
}
