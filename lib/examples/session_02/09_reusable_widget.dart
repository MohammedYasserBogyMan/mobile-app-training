import 'package:flutter/material.dart';

import '05_task_model.dart';

/// Session 02 - File 09
/// Concept: EXTRACT A REUSABLE WIDGET. This is the heart of the session.
///
/// Anatomy of every custom widget you will ever write, in this order:
///
///   1. Fields      - what the widget needs from outside. Always final.
///   2. Constructor - how callers pass those values in.
///   3. build()     - what it looks like, using those values.
///
/// Before: thirty lines of Container, repeated for every card.
/// After:  one line - TaskCard(task: tasks[index]) - and the thirty lines
///         live in exactly one place, where you edit them ONCE.
class TaskCard extends StatelessWidget {
  // 2. the constructor
  const TaskCard({super.key, required this.task});

  // 1. the input
  final Task task;

  // 3. the appearance
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
          Container(
            width: 34,
            height: 34,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: task.isDone
                  ? const Color(0xFFE7F6EC)
                  : const Color(0xFFE8F3FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              task.isDone ? Icons.check : Icons.assignment_outlined,
              size: 16,
              color: task.isDone
                  ? const Color(0xFF34A853)
                  : const Color(0xFF2474D6),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF2E3A4A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.time,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF9AA5B4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// The whole screen is now four lines of layout and one line of card.
class ReusableWidgetExample extends StatelessWidget {
  const ReusableWidgetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('09 - Reusable widget')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskCard(task: tasks[index]);
          },
        ),
      ),
    );
  }
}
