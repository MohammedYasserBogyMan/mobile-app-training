import 'package:flutter/material.dart';

/// Session 02 - File 03
/// Concept: the CROSS AXIS.
///
/// crossAxisAlignment moves the children ACROSS the main axis.
/// In a Column, that means LEFT and RIGHT - not mainAxisAlignment.
///
///   start   -> hug the start edge (left in a Column)
///   center  -> centred across the axis (the default)
///   end     -> hug the end edge
///   stretch -> forced to fill the whole cross axis
class CrossAxisAlignmentExample extends StatelessWidget {
  const CrossAxisAlignmentExample({super.key});

  static const List<CrossAxisAlignment> _values = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end,
    CrossAxisAlignment.stretch,
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('03 - crossAxisAlignment')),
        body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _values.length,
          itemBuilder: (context, index) {
            return _CrossAxisDemo(value: _values[index]);
          },
        ),
      ),
    );
  }
}

class _CrossAxisDemo extends StatelessWidget {
  const _CrossAxisDemo({required this.value});

  final CrossAxisAlignment value;

  @override
  Widget build(BuildContext context) {
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
            'Column with crossAxisAlignment.$label',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2E3A4A),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F6FA),
              borderRadius: BorderRadius.circular(8),
            ),
            // This is the only line that changes between the four examples.
            child: Column(
              crossAxisAlignment: value,
              children: const [
                _Pill('Short'),
                SizedBox(height: 8),
                _Pill('A longer label'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Pill extends StatelessWidget {
  const _Pill(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2474D6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
