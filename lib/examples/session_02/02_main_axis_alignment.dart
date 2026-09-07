import 'package:flutter/material.dart';

/// Session 02 - File 02
/// Concept: the MAIN AXIS.
///
///   Row    -> main axis is HORIZONTAL, cross axis is vertical.
///   Column -> main axis is VERTICAL,   cross axis is horizontal.
///
/// mainAxisAlignment moves the children ALONG the main axis.
/// It can only do something when the Row (or Column) has spare room left.
class MainAxisAlignmentExample extends StatelessWidget {
  const MainAxisAlignmentExample({super.key});

  // The six values, in the order they appear on the slide.
  static const List<MainAxisAlignment> _values = [
    MainAxisAlignment.start,
    MainAxisAlignment.center,
    MainAxisAlignment.end,
    MainAxisAlignment.spaceBetween,
    MainAxisAlignment.spaceAround,
    MainAxisAlignment.spaceEvenly,
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('02 - mainAxisAlignment')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _values.length,
          itemBuilder: (context, index) {
            final MainAxisAlignment value = _values[index];
            return _AlignmentRow(value: value);
          },
        ),
      ),
    );
  }
}

class _AlignmentRow extends StatelessWidget {
  const _AlignmentRow({required this.value});

  final MainAxisAlignment value;

  @override
  Widget build(BuildContext context) {
    // 'MainAxisAlignment.start' -> 'start'
    final String label = value.toString().split('.').last;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2E3A4A),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6FA),
              borderRadius: BorderRadius.circular(8),
            ),
            // This is the only line that changes between the six examples.
            child: Row(
              mainAxisAlignment: value,
              children: const [_Box('1'), _Box('2'), _Box('3')],
            ),
          ),
        ],
      ),
    );
  }
}

class _Box extends StatelessWidget {
  const _Box(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFF2474D6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
