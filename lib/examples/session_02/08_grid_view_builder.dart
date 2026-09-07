import 'package:flutter/material.dart';

import '05_task_model.dart';

/// Session 02 - File 08
/// Concept: GridView.builder - the same idea, in two dimensions.
///
///   itemCount and itemBuilder work EXACTLY as in ListView.builder.
///   gridDelegate is the only new part: it describes the shape of the grid -
///   how many columns, the spacing, and the ratio of each cell.
///
/// TaskFlow does not use a grid. You will need one for galleries, dashboards
/// and product lists, so it is worth recognising the pattern.
class GridViewBuilderExample extends StatelessWidget {
  const GridViewBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('08 - GridView.builder')),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: tasks.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // two columns
            crossAxisSpacing: 12, // gap between columns
            mainAxisSpacing: 12, // gap between rows
            childAspectRatio: 1.3, // width / height of one cell
          ),
          itemBuilder: (context, index) {
            final Task task = tasks[index];

            return Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE6EAF1)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    task.isDone ? Icons.check_circle : Icons.assignment,
                    size: 20,
                    color: task.isDone
                        ? const Color(0xFF34A853)
                        : const Color(0xFF2474D6),
                  ),
                  const Spacer(),
                  Text(
                    task.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 12,
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
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF9AA5B4),
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
