import 'package:flutter_test/flutter_test.dart';
import 'package:skill_forge_app/app/app.dart';
import 'package:skill_forge_app/core/constants/app_constants.dart';

void main() {
  testWidgets('SkillForgeApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SkillForgeApp());

    // Verify title appears on splash screen
    expect(find.text(AppConstants.appName), findsOneWidget);

    // Drain pending splash timer to ensure clean tear down
    await tester.pump(const Duration(seconds: 4));
  });
}
