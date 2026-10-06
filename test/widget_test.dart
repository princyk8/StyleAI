import 'package:flutter_test/flutter_test.dart';
import 'package:style_ai/app.dart';

void main() {
  testWidgets('StyleAI app loads', (WidgetTester tester) async {
    await tester.pumpWidget(
      const StyleAIApp(),
    );

    expect(
      find.byType(StyleAIApp),
      findsOneWidget,
    );
  });
}