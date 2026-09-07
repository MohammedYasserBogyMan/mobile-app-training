import 'package:flutter/material.dart';
import 'package:task_flow/models/task.dart';

class TaskInfoCard extends StatelessWidget {
  const TaskInfoCard({super.key, required this.task});

  final Task task;

  Color get priorityBackground {
    if (task.priority == 'عالية') return const Color(0xFFFFEEF1);
    if (task.priority == 'متوسطة') return const Color(0xFFFFF6D9);
    return const Color(0xFFEAF3FF);
  }

  Color get priorityTextColor {
    if (task.priority == 'عالية') return const Color(0xFFE9556A);
    if (task.priority == 'متوسطة') return const Color(0xFFE7A600);
    return const Color(0xFF7AAEF0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: Column(
        children: [
          TaskDetailsPriorityInfoRow(
            priority: task.priority,
            background: priorityBackground,
            textColor: priorityTextColor,
          ),
          const SizedBox(height: 20),
          TaskDetailsInfoRow(label: 'موعد التسليم', value: task.date),
          const SizedBox(height: 20),
          TaskDetailsInfoRow(
            label: 'الحالة',
            value: task.status,
            valueColor: task.isCompleted
                ? const Color(0xFF34A853)
                : const Color(0xFF2474D6),
          ),
        ],
      ),
    );
  }
}

class TaskDetailsPriorityInfoRow extends StatelessWidget {
  const TaskDetailsPriorityInfoRow({
    super.key,
    required this.priority,
    required this.background,
    required this.textColor,
  });

  final String priority;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: TaskDetailsInfoLabel('الأولوية')),
        TaskDetailsPriorityBadge(
          text: priority,
          background: background,
          textColor: textColor,
        ),
      ],
    );
  }
}

class TaskDetailsInfoRow extends StatelessWidget {
  const TaskDetailsInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.valueColor = const Color(0xFF2E3A4A),
  });

  final String label;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: TaskDetailsInfoLabel(label)),
        TaskDetailsInfoValue(value, color: valueColor),
      ],
    );
  }
}

class TaskDetailsInfoLabel extends StatelessWidget {
  const TaskDetailsInfoLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Color(0xFF9AA5B4),
      ),
    );
  }
}

class TaskDetailsInfoValue extends StatelessWidget {
  const TaskDetailsInfoValue(
    this.text, {
    super.key,
    this.color = const Color(0xFF2E3A4A),
  });

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
    );
  }
}

class TaskDetailsPriorityBadge extends StatelessWidget {
  const TaskDetailsPriorityBadge({
    super.key,
    required this.text,
    required this.background,
    required this.textColor,
  });

  final String text;
  final Color background;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(11),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }
}
