import 'package:authenticate_module/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); //Set up Integration Test environment.
  testWidgets('User Login Flow', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp()); //Launch the application to start testing.

    await tester.enterText(find.byType(TextFormField).at(0), 'test@email.com'); //Simulate user entering email.
    await tester.enterText(find.byType(TextFormField).at(1), 'password123'); //Simulate user entering password
    await tester.tap(find.byType(ElevatedButton)); //Simulate user clicking button
    await tester.pumpAndSettle(); //Ensure all UI changes are complete.

    expect(find.text('Welcome Home!'), findsOneWidget); //Confirm that the Home screen appears.
  });
}
