import 'package:flutter/material.dart';

import '07_task_card.dart';

class TaskFlowHome extends StatelessWidget {
  const TaskFlowHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 24, 18, 110),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const _TopBar(),
                  const SizedBox(height: 24),
                  const Text(
                    '\u0635\u0628\u0627\u062d \u0627\u0644\u062e\u064a\u0631 \u0645\u062d\u0645\u062f',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 22,
                      height: 1.2,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF172435),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '\u0627\u0628\u062f\u0623 \u064a\u0648\u0645\u0643 \u0628\u062a\u0646\u0638\u064a\u0645 \u0645\u0647\u0627\u0645\u0643 \u0628\u0628\u0633\u0627\u0637\u0629',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFA7B0BE),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    height: 38,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE8F3FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Text(
                      '\u0663 \u0645\u0647\u0627\u0645 \u0627\u0644\u064a\u0648\u0645',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF2474D6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  const Text(
                    '\u0645\u0647\u0627\u0645\u0643',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 17,
                      height: 1.2,
                      fontWeight: FontWeight.w900,
                      color: Color(0xFF2B3747),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const TaskCard(
                    title:
                        '\u0648\u0627\u062c\u0628 \u0641\u0644\u0627\u062a\u0631',
                    date: '\u0627\u0644\u064a\u0648\u0645 -- \u0668 \u0645',
                    priority: '\u0639\u0627\u0644\u064a\u0629',
                    icon: Icons.assignment,
                  ),
                  const TaskCard(
                    title:
                        '\u0645\u0634\u0631\u0648\u0639 \u0642\u0648\u0627\u0639\u062f \u0627\u0644\u0628\u064a\u0627\u0646\u0627\u062a',
                    date: '\u063a\u062f\u0627 -- \u0661\u0660 \u0635',
                    priority: '\u0645\u062a\u0648\u0633\u0637\u0629',
                    icon: Icons.storage,
                  ),
                  const TaskCard(
                    title:
                        '\u062a\u062f\u0631\u064a\u0628 \u062a\u0635\u0645\u064a\u0645 \u0627\u0644\u0648\u0627\u062c\u0647\u0629',
                    date:
                        '\u0627\u0644\u062c\u0645\u0639\u0629 -- \u0669 \u0635',
                    priority: '\u0645\u0646\u062e\u0641\u0636\u0629',
                    icon: Icons.brush,
                  ),
                ],
              ),
            ),
            Positioned(
              right: 18,
              bottom: 18,
              child: FloatingActionButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        '\u0625\u0636\u0627\u0641\u0629 \u0645\u0647\u0645\u0629 \u062c\u062f\u064a\u062f\u0629',
                      ),
                    ),
                  );
                },
                child: const Icon(Icons.add, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopBar extends StatelessWidget {
  const _TopBar();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'TaskFlow',
            style: TextStyle(
              fontSize: 16,
              height: 1,
              fontWeight: FontWeight.w900,
              color: Color(0xFF172435),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF2474D6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.check, size: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
