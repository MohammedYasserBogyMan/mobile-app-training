import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.title,
    required this.date,
    required this.priority,
    required this.icon,
  });

  final String title;
  final String date;
  final String priority;
  final IconData icon;

  Color _priorityBackground() {
    if (priority == 'High' || priority == '\u0639\u0627\u0644\u064a\u0629') {
      return const Color(0xFFFFEEF1);
    } else if (priority == 'Medium' ||
        priority == '\u0645\u062a\u0648\u0633\u0637\u0629') {
      return const Color(0xFFFFF6D9);
    } else {
      return const Color(0xFFEAF3FF);
    }
  }

  Color _priorityTextColor() {
    if (priority == 'High' || priority == '\u0639\u0627\u0644\u064a\u0629') {
      return const Color(0xFFFF7D8A);
    } else if (priority == 'Medium' ||
        priority == '\u0645\u062a\u0648\u0633\u0637\u0629') {
      return const Color(0xFFE7A600);
    } else {
      return const Color(0xFF7AAEF0);
    }
  }

  String _priorityLabel() {
    if (priority == 'High') return '\u0639\u0627\u0644\u064a\u0629';
    if (priority == 'Medium') return '\u0645\u062a\u0648\u0633\u0637\u0629';
    if (priority == 'Low') return '\u0645\u0646\u062e\u0641\u0636\u0629';
    return priority;
  }

  @override
  Widget build(BuildContext context) {
    final Color badgeBackground = _priorityBackground();
    final Color badgeTextColor = _priorityTextColor();

    return Container(
      width: double.infinity,
      height: 64,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsetsDirectional.only(start: 10, end: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF1)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF182334).withValues(alpha: 0.04),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Container(
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: badgeBackground,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                _priorityLabel(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: badgeTextColor,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 12,
                        height: 1.1,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2E3A4A),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 10,
                        height: 1.1,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF9AA5B4),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: const Color(0xFFEAF3FF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.check,
                size: 16,
                color: Color(0xFF2474D6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCardExample extends StatelessWidget {
  const TaskCardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Card')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TaskCard(
              title: '\u0648\u0627\u062c\u0628 \u0641\u0644\u0627\u062a\u0631',
              date: '\u0627\u0644\u064a\u0648\u0645 -- 8 \u0645',
              priority: 'High',
              icon: Icons.assignment,
            ),
            TaskCard(
              title:
                  '\u0645\u0634\u0631\u0648\u0639 \u0642\u0648\u0627\u0639\u062f \u0627\u0644\u0628\u064a\u0627\u0646\u0627\u062a',
              date: '\u063a\u062f\u0627 -- 10 \u0635',
              priority: 'Medium',
              icon: Icons.storage,
            ),
            TaskCard(
              title:
                  '\u062a\u062f\u0631\u064a\u0628 \u062a\u0635\u0645\u064a\u0645 \u0627\u0644\u0648\u0627\u062c\u0647\u0629',
              date: '\u0627\u0644\u062c\u0645\u0639\u0629 -- 9 \u0635',
              priority: 'Low',
              icon: Icons.brush,
            ),
          ],
        ),
      ),
    );
  }
}
