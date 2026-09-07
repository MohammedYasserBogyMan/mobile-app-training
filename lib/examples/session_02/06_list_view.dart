import 'package:flutter/material.dart';

import '05_task_model.dart';

/// Session 02 - File 06
/// Concept: ListView - a Column that scrolls.
///
///   + It scrolls. Unlike a Column it never overflows.
///   - It builds EVERYTHING immediately, even the children that are off
///     screen. Fine for a settings page, wrong for 1,000 items.
///
/// Use it only when you know every child up front.
class ListViewExample extends StatelessWidget {
  const ListViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('06 - ListView')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          // Every child is written by hand, one by one.
          children: [
            _SimpleRow(task: tasks[0]),
            _SimpleRow(task: tasks[1]),
            _SimpleRow(task: tasks[2]),
            _SimpleRow(task: tasks[3]),
            _SimpleRow(task: tasks[4]),
          ],
        ),
      ),
    );
  }
}

class _SimpleRow extends StatelessWidget {
  const _SimpleRow({required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2E3A4A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.time,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9AA5B4),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            task.isDone ? Icons.check_circle : Icons.circle_outlined,
            size: 20,
            color: task.isDone
                ? const Color(0xFF34A853)
                : const Color(0xFFC8D2E0),
          ),
        ],
      ),
    );
  }
}
