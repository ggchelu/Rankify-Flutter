import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rankify/main.dart';

void main() {
  testWidgets('App should build without errors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(child: RankifyApp()),
    );
    
    // Verify the app builds
    expect(find.byType(RankifyApp), findsOneWidget);
  });
}
