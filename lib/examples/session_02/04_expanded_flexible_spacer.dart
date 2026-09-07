import 'package:flutter/material.dart';

/// Session 02 - File 04
/// Concept: FILLING SPACE inside a Row or a Column.
///
///   Expanded -> takes all the free space, ALWAYS. Forces the child to fill.
///               flex: 2 takes twice as much as a flex: 1 sibling.
///               This is the fix for most overflow errors.
///   Flexible -> MAY take space, but is not forced to. The child keeps its
///               natural size and only shrinks if it must.
///   Spacer   -> an invisible flexible gap that pushes siblings apart.
///
/// All three only work inside a Row, a Column or a Flex - never on their own.
class ExpandedFlexibleSpacerExample extends StatelessWidget {
  const ExpandedFlexibleSpacerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('04 - Expanded / Flexible / Spacer')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // 1. Plain Row: the three boxes keep their own width and leave
            //    a gap on the right.
            _Demo(
              title: '1. Row with no Expanded',
              child: Row(children: const [_Box('1'), _Box('2'), _Box('3')]),
            ),

            // 2. One Expanded child eats every free pixel.
            _Demo(
              title: '2. The middle child is Expanded',
              child: Row(
                children: const [
                  _Box('1'),
                  Expanded(child: _Box('2 - Expanded')),
                  _Box('3'),
                ],
              ),
            ),

            // 3. flex shares the free space in a ratio.
            _Demo(
              title: '3. flex: 1 and flex: 2 share the space',
              child: Row(
                children: const [
                  Expanded(flex: 1, child: _Box('flex 1')),
                  Expanded(flex: 2, child: _Box('flex 2')),
                ],
              ),
            ),

            // 4. Flexible keeps the natural size when there is room to spare.
            _Demo(
              title: '4. Flexible keeps its natural size',
              child: Row(
                children: const [
                  Flexible(child: _Box('Flexible')),
                  _Box('fixed'),
                ],
              ),
            ),

            // 5. Spacer pushes the two siblings to the two ends.
            _Demo(
              title: '5. Spacer pushes the siblings apart',
              child: Row(
                children: const [_Box('start'), Spacer(), _Box('end')],
              ),
            ),

            // 6. The real reason we care: long text overflows a Row.
            //    Expanded gives the Text a maximum width, so it can wrap
            //    or shorten with an ellipsis instead of overflowing.
            _Demo(
              title: '6. Expanded is the fix for overflowing text',
              child: Row(
                children: const [
                  Icon(Icons.assignment, size: 20, color: Color(0xFF2474D6)),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'A very long task title that would overflow the row '
                      'if it were not wrapped in an Expanded widget',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF2E3A4A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      height: 36,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF2474D6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
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
            title,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Color(0xFF2E3A4A),
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }
}
