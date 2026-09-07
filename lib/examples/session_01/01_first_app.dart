import 'package:flutter/material.dart';

void main() {
  runApp(const FirstApp());
}

class FirstApp extends StatelessWidget {
  const FirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskFlow',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // textTheme: GoogleFonts.cairoTextTheme(),
        scaffoldBackgroundColor: const Color(0xFFF3F6FA),
      ),
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: FirstAppExample(),
      ),
    );
  }
}

class FirstAppExample extends StatelessWidget {
  const FirstAppExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 24, 18, 0),
          child: Align(
            alignment: Alignment.topRight,
            child: Center(
              child: Text(
                'TaskFlow',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF172435),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
