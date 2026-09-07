import 'package:flutter_test/flutter_test.dart';
import 'package:task_flow/main.dart';

void main() {
  testWidgets('TaskFlow app starts', (tester) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('TaskFlow'), findsOneWidget);
    expect(find.text('مهامك'), findsOneWidget);
  });
}
