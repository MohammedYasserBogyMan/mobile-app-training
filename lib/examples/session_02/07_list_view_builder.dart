import 'package:flutter/material.dart';

import '05_task_model.dart';

/// Session 02 - File 07
/// Concept: ListView.builder - the one you will actually use.
///
///   itemCount   -> how many items exist in total.
///   itemBuilder -> a function Flutter calls to build ONE item.
///   index       -> which item is being built right now: 0, 1, 2 ...
///
/// You describe one item. Flutter builds only what fits on the screen, and
/// reuses those widgets as you scroll.
///
/// Compare this file with file 06: the data is identical, the number of
/// hand-written children drops from five to zero, and adding a sixth task
/// now needs NO change to the UI code at all.
class ListViewBuilderExample extends StatelessWidget {
  const ListViewBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('07 - ListView.builder')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            // Pick the object for THIS index, then describe one row.
            final Task task = tasks[index];

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
                  // The index is useful too - here it numbers the rows.
                  Container(
                    width: 26,
                    height: 26,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F3FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$index',
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2474D6),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
