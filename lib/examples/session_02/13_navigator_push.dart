import 'package:flutter/material.dart';

/// Session 02 - File 13
/// Concept: NAVIGATION - screens are a stack of cards.
///
///   push -> put a new card on top. The new screen slides in and covers the
///           old one.
///   pop  -> remove the top card. The screen underneath is revealed again,
///           completely unchanged.
///
/// The user only ever sees the top card. Everything underneath is still
/// alive - it is just covered.
///
///   Navigator.push(
///     context,                        // which navigator we are talking to
///     MaterialPageRoute(              // wraps the screen, adds the platform
///       builder: (context) => ...,    // transition animation
///     ),                              // builder returns the screen widget
///   );                                // when it is needed
///
/// You rarely call pop yourself: an AppBar with a screen underneath it draws
/// a back arrow automatically, and the Android back button and the iOS swipe
/// gesture both call pop for you.
class NavigatorPushExample extends StatelessWidget {
  const NavigatorPushExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('13 - Navigator.push')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'This is the FIRST card on the stack.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E3A4A),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const _SecondScreen(),
                    ),
                  );
                },
                child: const Text('Open the second screen'),
              ),
              const SizedBox(height: 12),
              const Text(
                'Watch the back arrow appear on the next screen. Nobody '
                'wrote it - the Navigator knows there is a card underneath.',
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

/// The pushed screen. It is an ordinary widget - nothing about it is special.
class _SecondScreen extends StatelessWidget {
  const _SecondScreen();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('Second screen')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'This card is now on top. The first one is still alive '
                'underneath, exactly as you left it.',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF2E3A4A),
                ),
              ),
              const SizedBox(height: 20),
              OutlinedButton(
                onPressed: () {
                  // The same thing the back arrow does.
                  Navigator.pop(context);
                },
                child: const Text('Navigator.pop(context)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
