import 'package:flutter_test/flutter_test.dart';
import 'package:velotoulouse/main_common.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    mainCommon([]);
    await tester.pumpAndSettle();
    expect(find.textContaining('Hello'), findsOneWidget);
  });
}
