import 'package:flutter_test/flutter_test.dart';

void main() {
  test('1 + 1 should equal 2', () {
    expect(1 + 1, equals(2));
  });

  group('String Tests', () {
    test('Uppercase conversion', () {
      expect('hello'.toUpperCase(), equals('HELLO'));
    });

    test('Lowercase conversion', () {
      expect('HELLO'.toLowerCase(), equals('hello'));
    });
  });
}
