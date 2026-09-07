import 'package:flutter/material.dart';
import 'package:task_flow/models/task.dart';
import 'package:task_flow/widgets/status_box.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key, required this.task, required this.onTap});

  final Task task;
  final VoidCallback onTap;

  Color get priorityBackground {
    if (task.priority == 'عالية') return Color(0xFFFFEEF1);
    if (task.priority == 'متوسطة') return Color(0xFFFFF6D9);
    return Color(0xFFEAF3FF);
  }

  Color get priorityTextColor {
    if (task.priority == 'عالية') return Color(0xFFE9556A);
    if (task.priority == 'متوسطة') return Color(0xFFE7A600);
    return Color(0xFF7AAEF0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFE6EAF1)),
      ),

      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: [
              StatusBox(isCompleted: task.isCompleted),
              SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      task.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.2,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E3A4A),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      task.date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11,
                        height: 1.2,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9AA5B4),
                      ),
                    ),
                  ],
                ),
              ),

              PriorityBadge(
                priorityBackground: priorityBackground,

                priorityTextColor: priorityTextColor,
                task: task,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PriorityBadge extends StatelessWidget {
  const PriorityBadge({
    super.key,
    required this.priorityBackground,
    required this.priorityTextColor,
    required this.task,
  });

  final Color priorityBackground;
  final Color priorityTextColor;
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: priorityBackground,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Text(
        task.priority,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: priorityTextColor,
        ),
      ),
    );
  }
}
