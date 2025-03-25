import 'package:authenticate_module/service/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AuthService authService;

  setUp(() {
    authService = AuthService();
  });

  group('Login', () {
    test('Login should succeed with correct credentials', () {
      expect(authService.login('test@email.com', 'password123'), true);
    });  //Log in with valid email and password


    test('Login should throw Exception on empty fields', () {
      expect(() => authService.login('', ''), throwsException);
    }); //Login with empty email and password should throw exception

    test('Login should throw Exception on wrong credentials', () {
      expect(() => authService.login('wrong@email.com', 'wrongpass'), throwsException);
    }); //Login with incorrect email and password should throw exception
  });
}
