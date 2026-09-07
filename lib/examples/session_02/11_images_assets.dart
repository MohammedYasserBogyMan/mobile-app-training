import 'package:flutter/material.dart';

/// Session 02 - File 11
/// Concept: IMAGES - assets that ship with the app, and images from the net.
///
/// Three steps to add an asset:
///
///   1. Create the folder      assets/images/ at the root of the project.
///   2. Declare it in pubspec.yaml
///
///        flutter:
///          assets:
///            - assets/images/
///
///      Indentation matters - YAML is strict about spaces.
///   3. Use it in code         Image.asset('assets/images/empty_tasks.png')
///
/// Image.asset   ships inside the app, works offline, grows the app size.
///               Logos, icons, empty-state art.
/// Image.network downloaded at runtime, needs a connection, keeps the app
///               small. User avatars, product photos.
///
/// Both accept width, height and fit. BoxFit.cover is the one you will use
/// most: it fills the box and crops whatever does not fit.
class ImagesAssetsExample extends StatelessWidget {
  const ImagesAssetsExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(title: const Text('11 - Images and assets')),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const _Label('Image.asset - ships inside the app'),
            _Card(
              child: Image.asset(
                'assets/images/empty_tasks.png',
                width: 160,
                height: 160,
              ),
            ),

            const _Label('The same asset, forced into a 120 x 90 box'),
            _Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/empty_tasks.png',
                          width: 120,
                          height: 90,
                          fit: BoxFit.cover, // fills the box, crops the rest
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('BoxFit.cover', style: _captionStyle),
                    ],
                  ),
                  Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          'assets/images/empty_tasks.png',
                          width: 120,
                          height: 90,
                          fit: BoxFit.contain, // fits it all in, leaves gaps
                        ),
                      ),
                      const SizedBox(height: 6),
                      const Text('BoxFit.contain', style: _captionStyle),
                    ],
                  ),
                ],
              ),
            ),

            const _Label('Image.network - downloaded while the app runs'),
            _Card(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  'https://picsum.photos/400/200',
                  width: double.infinity,
                  height: 120,
                  fit: BoxFit.cover,
                  // Shown while the bytes are still arriving.
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return const SizedBox(
                      height: 120,
                      child: Center(child: CircularProgressIndicator()),
                    );
                  },
                  // Shown when there is no connection at all.
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120,
                      alignment: Alignment.center,
                      color: const Color(0xFFF3F6FA),
                      child: const Text(
                        'No connection - this is why assets exist',
                        style: _captionStyle,
                      ),
                    );
                  },
                ),
              ),
            ),

            const _Label('A real use: the empty state of a task list'),
            _Card(
              child: Column(
                children: [
                  Image.asset('assets/images/empty_tasks.png', width: 120),
                  const SizedBox(height: 10),
                  const Text(
                    'No tasks yet',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF2E3A4A),
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Add your first task to get started',
                    style: _captionStyle,
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

const TextStyle _captionStyle = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w600,
  color: Color(0xFF9AA5B4),
);

class _Card extends StatelessWidget {
  const _Card({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.only(bottom: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EAF1)),
      ),
      child: Center(child: child),
    );
  }
}

class _Label extends StatelessWidget {
  const _Label(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 8),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: Color(0xFF9AA5B4),
        ),
      ),
    );
  }
}
