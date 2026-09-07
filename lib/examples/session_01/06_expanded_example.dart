import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 238, 18, 0),
          child: Container(
            width: double.infinity,
            height: 64,
            padding: const EdgeInsetsDirectional.only(start: 10, end: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE6EAF1)),
            ),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEEF1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      '\u0639\u0627\u0644\u064a\u0629',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFF7D8A),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\u0648\u0627\u062c\u0628 \u0641\u0644\u0627\u062a\u0631 \u0644\u0645\u062d\u0627\u0636\u0631\u0629 \u062a\u0637\u0628\u064a\u0642\u0627\u062a \u0627\u0644\u0645\u0648\u0628\u0627\u064a\u0644',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 12,
                              height: 1.1,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF2E3A4A),
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\u0627\u0644\u064a\u0648\u0645 -- \u0668 \u0645',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 10,
                              height: 1.1,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9AA5B4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: const Color(0xFFEAF3FF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.check,
                      size: 16,
                      color: Color(0xFF2474D6),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
