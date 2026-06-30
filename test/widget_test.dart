import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:anglers_note/src/app.dart';

void main() {
  testWidgets('starts on home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AnglersNoteApp()));
    await tester.pumpAndSettle();

    expect(find.text('Anglers Note'), findsOneWidget);
    expect(find.text('釣行を記録する'), findsOneWidget);
  });
}
