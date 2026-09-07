import 'package:flutter/material.dart';

import '05_task_model.dart';

/// Session 02 - File 10
/// Concept: PARAMETERS - passing values into your own widget.
///
/// This is the TaskCard of file 09 with two extra parameters, so you can see
/// the three kinds of input side by side:
///
///   required this.task          caller MUST pass it - compile error if not
///   this.accent = Color(...)    optional, falls back to the default
///   this.onTap                  optional AND nullable - may simply be absent
///
/// Ask yourself, for every widget you write: what does this widget need from
/// outside? That is your parameter.
class TaskCardWithOptions extends StatelessWidget {
  const TaskCardWithOptions({
    super.key,
    required this.task,
    this.accent = const Color(0xFF2474D6),
    this.onTap,
  });

  final Task task; // required
  final Color accent; // has a default
  final VoidCallback? onTap; // optional, may be null

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // Passing null here simply makes the card not tappable.
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Container(
                  width: 34,
                  height: 34,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // The accent parameter decides this colour.
                    color: accent.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    task.isDone ? Icons.check : Icons.assignment_outlined,
                    size: 16,
                    color: accent,
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
                // onTap == null -> no arrow, because nothing would happen.
                if (onTap != null)
                  const Icon(
                    Icons.chevron_right,
                    size: 18,
                    color: Color(0xFFC8D2E0),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WidgetParametersExample extends StatelessWidget {
  const WidgetParametersExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('10 - Widget parameters')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _Label('Only the required parameter'),
            TaskCardWithOptions(task: tasks[0]),

            const _Label('accent overridden'),
            TaskCardWithOptions(
              task: tasks[1],
              accent: const Color(0xFFE7A600),
            ),

            const _Label('accent and onTap given'),
            TaskCardWithOptions(
              task: tasks[2],
              accent: const Color(0xFF34A853),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tapped ${tasks[2].title}')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 6),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Color(0xFF9AA5B4),
        ),
      ),
    );
  }
}
