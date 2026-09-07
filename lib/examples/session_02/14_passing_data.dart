import 'package:flutter/material.dart';

import '05_task_model.dart';
import '09_reusable_widget.dart';

/// Session 02 - File 14
/// Concept: SENDING DATA to the next screen.
///
/// There is no special mechanism for this. A screen is just a widget, so you
/// pass values to its constructor - exactly like TaskCard(task: ...).
///
///   // on the sending screen
///   Navigator.push(
///     context,
///     MaterialPageRoute(
///       builder: (_) => TaskDetailsScreen(task: tasks[index]),
///     ),
///   );
///
///   // on the receiving screen
///   class TaskDetailsScreen extends StatelessWidget {
///     final Task task;
///     const TaskDetailsScreen({super.key, required this.task});
///   }
///
/// InkWell makes the card react to a tap. GestureDetector works too, but
/// InkWell also draws the ripple.
class PassingDataExample extends StatelessWidget {
  const PassingDataExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('14 - Passing data forward')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final Task task = tasks[index];

            return InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // The task for THIS index travels to the next screen.
                    builder: (_) => TaskDetailsScreen(task: task),
                  ),
                );
              },
              // TaskCard is reused unchanged from file 09.
              child: TaskCard(task: task),
            );
          },
        ),
      ),
    );
  }
}

/// The receiving screen. Its only input is one Task.
class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('Task details')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF172435),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                task.time,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF9AA5B4),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE6EAF1)),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Status',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9AA5B4),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      task.isDone ? 'Completed' : 'Active',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: task.isDone
                            ? const Color(0xFF34A853)
                            : const Color(0xFF2474D6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
