import 'package:authenticate_module/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); //Thiết lập môi trường test.

  testWidgets('User Login Flow', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp()); //Khởi động ứng dụng để bắt đầu test.

    await tester.enterText(find.byType(TextFormField).at(0), 'test@email.com'); //Mô phỏng người dùng nhập email.
    await tester.enterText(find.byType(TextFormField).at(1), 'password123'); //Mô phỏng người dùng nhập password
    await tester.tap(find.byType(ElevatedButton)); //Mô phỏng người dùng nhấn button 
    await tester.pumpAndSettle(); //Đảm bảo mọi thay đổi UI hoàn thành.

    expect(find.text('Welcome Home!'), findsOneWidget); //Xác nhận rằng màn hình Home đã xuất hiện.
  });
}
