import 'package:flutter/material.dart';

/// Session 02 - File 15
/// Concept: RECEIVING DATA - getting a result back from a screen.
///
///   // 1. wait for the pushed screen to close
///   final result = await Navigator.push(
///     context,
///     MaterialPageRoute(builder: (_) => const AddTaskScreen()),
///   );
///
///   // 2. on the other screen, hand a value back
///   Navigator.pop(context, newTask);
///
/// The word await is new, and that is fine. It means: pause here until the
/// other screen closes, then continue with whatever it returned.
/// Asynchronous programming is the whole of session 4 - today just accept
/// the shape of it.
///
/// Two details worth naming out loud:
///   - the callback is marked async, because it uses await;
///   - after an await, always check context.mounted before using context
///     again. The screen may be gone by then.
class ReturningDataExample extends StatelessWidget {
  const ReturningDataExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('15 - Returning data')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Push a screen, then read what it hands back when it closes.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E3A4A),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final String? result = await Navigator.push<String>(
                    context,
                    MaterialPageRoute(builder: (_) => const AddTaskScreen()),
                  );

                  // The screen may have been disposed while we waited.
                  if (!context.mounted) return;

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        result == null
                            ? 'The screen was closed with no result'
                            : 'The screen returned: $result',
                      ),
                    ),
                  );
                },
                child: const Text('Open the add-task screen'),
              ),
              const SizedBox(height: 12),
              const Text(
                'Close it with the back arrow instead, and the result is '
                'null - nothing was handed back.',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF9AA5B4),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A placeholder add-task screen. It has no text field yet - typing and
/// storing what the user typed both need state, which is session 3.
class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  static const List<String> _suggestions = [
    'Prepare session 3 notes',
    'Review the reading list',
    'Sketch the add-task form',
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('Add task')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Pick one. The title you pick travels back to the screen that '
              'pushed this one.',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9AA5B4),
              ),
            ),
            const SizedBox(height: 16),
            for (final String suggestion in _suggestions)
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: OutlinedButton(
                  onPressed: () {
                    // The second argument is the value that travels back.
                    Navigator.pop(context, suggestion);
                  },
                  child: Text(suggestion),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
