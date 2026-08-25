import 'package:flutter_test/flutter_test.dart';
import 'package:skill_forge_app/app/app.dart';
import 'package:skill_forge_app/core/constants/app_constants.dart';

void main() {
  testWidgets('SkillForgeApp smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SkillForgeApp());
    await tester.pumpAndSettle();

    // Verify title appears on screen
    expect(find.text(AppConstants.appName), findsOneWidget);
  });
}
