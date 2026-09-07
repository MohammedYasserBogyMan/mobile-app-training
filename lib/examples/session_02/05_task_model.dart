import 'package:flutter/material.dart';

/// Session 02 - File 05
/// Concept: SEPARATE THE DATA FROM THE DISPLAY.
///
/// In session 1 the text lived inside the widgets. If we wanted a fourth task
/// we had to copy thirty lines of layout. Here the text lives in objects, and
/// the widgets only know how to draw one of them.
///
/// The screen no longer contains text. It contains a list of Task objects -
/// and that list can come from anywhere: a file, a database, a server.
class Task {
  const Task({required this.title, required this.time, this.isDone = false});

  final String title;
  final String time;
  final bool isDone;
}

/// Five hard-coded tasks. Files 06, 07 and 09 all read from this one list.
const List<Task> tasks = [
  Task(title: 'Flutter Assignment', time: 'Today - 8:00 PM'),
  Task(title: 'Database Project', time: 'Tomorrow - 10:00 AM'),
  Task(title: 'UI Design Practice', time: 'Friday - 9:00 AM'),
  Task(title: 'API Reading', time: 'Saturday - 1:00 PM'),
  Task(title: 'Wireframe Review', time: 'Monday - 11:00 AM', isDone: true),
];

/// This screen deliberately has almost no design. Its only job is to prove
/// that the data exists on its own, before any card widget is written.
class TaskModelExample extends StatelessWidget {
  const TaskModelExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('05 - The Task model')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'tasks.length = ${tasks.length}',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2474D6),
                ),
              ),
              const SizedBox(height: 14),

              // Reading one field of one object out of the list.
              Text(
                'tasks[0].title = ${tasks[0].title}',
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                'tasks[0].time = ${tasks[0].time}',
                style: const TextStyle(fontSize: 12),
              ),
              Text(
                'tasks[0].isDone = ${tasks[0].isDone}',
                style: const TextStyle(fontSize: 12),
              ),
              const SizedBox(height: 20),

              // Every title, printed with no design at all.
              const Text(
                'Every title in the list:',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              for (final Task task in tasks)
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    '- ${task.title} (${task.time})',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF6B7787),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
