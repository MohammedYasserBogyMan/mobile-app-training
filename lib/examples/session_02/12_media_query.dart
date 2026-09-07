import 'package:flutter/material.dart';

/// Session 02 - File 12
/// Concept: MediaQuery - knowing the size of the screen.
///
///   final size = MediaQuery.of(context).size;
///   size.width    full screen width in logical pixels
///   size.height   full screen height
///
///   Container(width: size.width * 0.9)   // 90 percent of the screen
///
/// Rules of thumb:
///   - Prefer relative sizes. Percentages survive different phones, fixed
///     pixels do not.
///   - Reach for Expanded FIRST. Most layouts need flex, not measurements.
///   - Use MediaQuery sparingly, only when the design genuinely depends on
///     the screen size.
///
/// A hard-coded width of 350 looks fine on your phone and broken on someone
/// else's. Rotate the device or resize the window to watch the numbers move.
class MediaQueryExample extends StatelessWidget {
  const MediaQueryExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Read the screen once, at the top of build().
    final Size size = MediaQuery.of(context).size;
    final EdgeInsets padding = MediaQuery.of(context).padding;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('12 - MediaQuery')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _Card(
              title: 'What MediaQuery reports',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _Row('size.width', size.width.toStringAsFixed(1)),
                  _Row('size.height', size.height.toStringAsFixed(1)),
                  _Row(
                    'padding.top (status bar)',
                    padding.top.toStringAsFixed(1),
                  ),
                  _Row(
                    'padding.bottom (home bar)',
                    padding.bottom.toStringAsFixed(1),
                  ),
                ],
              ),
            ),

            // A width expressed as a percentage of the screen.
            _Card(
              title: 'width: size.width * 0.9',
              child: Container(
                width: size.width * 0.9,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFF2474D6),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '${(size.width * 0.9).toStringAsFixed(0)} px on THIS screen',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // The mistake this fixes.
            _Card(
              title: 'The mistake: a hard-coded width of 350',
              child: Container(
                width: 350,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEEF1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Fine here, cut off on a small phone',
                  style: TextStyle(
                    color: Color(0xFFFF7D8A),
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // A decision taken from the width: one column or two.
            _Card(
              title: size.width < 600
                  ? 'width < 600 -> phone layout, one column'
                  : 'width >= 600 -> tablet layout, two columns',
              child: size.width < 600
                  ? Column(
                      children: const [
                        _Block('Block A'),
                        SizedBox(height: 8),
                        _Block('Block B'),
                      ],
                    )
                  : Row(
                      children: const [
                        Expanded(child: _Block('Block A')),
                        SizedBox(width: 8),
                        Expanded(child: _Block('Block B')),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  const _Row(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9AA5B4),
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2474D6),
            ),
          ),
        ],
      ),
    );
  }
}

class _Block extends StatelessWidget {
  const _Block(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE8F3FF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Color(0xFF2474D6),
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({required this.title, required this.child});

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
