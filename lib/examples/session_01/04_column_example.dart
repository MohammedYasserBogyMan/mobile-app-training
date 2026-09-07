import 'package:flutter/material.dart';

class ColumnExample extends StatelessWidget {
  const ColumnExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(24, 80, 18, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'صباح الخير محمد',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 22,
                height: 1.2,
                fontWeight: FontWeight.w900,
                color: Color(0xFF172435),
              ),
            ),
            SizedBox(height: 10),
            Text(
              'ابدأ يومك بتنظيم مهامك ببساطه',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w600,
                color: Color(0xFFA7B0BE),
              ),
            ),
            SizedBox(height: 40),
            Text(
              'مهامك',
              textAlign: TextAlign.right,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: Color(0xFF2B3747),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
