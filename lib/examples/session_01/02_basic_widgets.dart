import 'package:flutter/material.dart';

class BasicWidgetsExample extends StatelessWidget {
  const BasicWidgetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 18, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text(
                'TaskFlow',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF172435),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                '\u0635\u0628\u0627\u062d \u0627\u0644\u062e\u064a\u0631 \u0645\u062d\u0645\u062f',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF172435),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '\u0627\u0628\u062f\u0623 \u064a\u0648\u0645\u0643 \u0628\u062a\u0646\u0638\u064a\u0645 \u0645\u0647\u0627\u0645\u0643 \u0628\u0628\u0633\u0627\u0637\u0629',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFA7B0BE),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () {
                  debugPrint('Add task');
                },
                icon: const Icon(Icons.add),
                label: const Text(
                  '\u0625\u0636\u0627\u0641\u0629 \u0645\u0647\u0645\u0629',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
