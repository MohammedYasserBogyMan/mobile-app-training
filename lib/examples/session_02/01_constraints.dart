import 'package:flutter/material.dart';

/// Session 02 - File 01
/// Concept: THE GOLDEN RULE of Flutter layout.
///
///   1. Constraints go DOWN.  The parent tells the child:
///      "your width must be between X and Y, your height between A and B".
///   2. Sizes go UP.          The child picks its own size inside those
///                            limits and reports it back to the parent.
///   3. The parent POSITIONS. The parent decides where the child sits.
///
/// A widget never knows where it is. It only knows how big it is allowed to be.
///
/// LayoutBuilder is used here only so we can SEE the constraints as text.
class ConstraintsExample extends StatelessWidget {
  const ConstraintsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('01 - Constraints')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _Note(
              'The parent hands down a range. The child answers with a size.',
            ),
            const SizedBox(height: 14),

            // 1. The child asks for 600 pixels of width.
            //    The parent only allows the screen width, so 600 is IGNORED.
            _Demo(
              title: '1. Child asks for 600 - parent says no',
              child: _MeasuredBox(
                child: Container(
                  width: 600,
                  height: 56,
                  color: const Color(0xFF2474D6),
                ),
              ),
            ),

            // 2. A Container with no width shrinks to fit its child.
            _Demo(
              title: '2. No width + Align -> shrinks to the child',
              child: _MeasuredBox(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    color: const Color(0xFF2474D6),
                    padding: const EdgeInsets.all(14),
                    child: const Text(
                      'I am as wide as my text',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),

            // 3. Same Container, but now the parent forces it to be wide.
            _Demo(
              title: '3. Same Container, parent forces the full width',
              child: _MeasuredBox(
                child: Container(
                  width: double.infinity,
                  color: const Color(0xFF2474D6),
                  padding: const EdgeInsets.all(14),
                  child: const Text(
                    'The parent decided my width',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Shows the constraints a widget receives, then renders the widget itself.
class _MeasuredBox extends StatelessWidget {
  const _MeasuredBox({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'constraints down: width '
              '${constraints.minWidth.toStringAsFixed(0)} .. '
              '${constraints.maxWidth.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: Color(0xFF9AA5B4),
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(borderRadius: BorderRadius.circular(8), child: child),
          ],
        );
      },
    );
  }
}

class _Demo extends StatelessWidget {
  const _Demo({required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2E3A4A),
            ),
          ),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }
}

class _Note extends StatelessWidget {
  const _Note(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: Color(0xFF2474D6),
        ),
      ),
    );
  }
}
