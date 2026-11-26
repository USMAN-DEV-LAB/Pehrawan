import 'package:flutter_test/flutter_test.dart';
import 'package:pehrawan/core/utils/validators.dart';

void main() {
  group('Validators', () {
    test('accepts valid Pakistani mobile numbers', () {
      expect(Validators.isValidPakistaniPhone('03001234567'), isTrue);
      expect(Validators.isValidPakistaniPhone('+923001234567'), isTrue);
      expect(Validators.isValidPakistaniPhone('0300 123 4567'), isTrue);
      expect(Validators.isValidPakistaniPhone('+92 300 1234567'), isTrue);
    });

    test('rejects invalid Pakistani mobile numbers', () {
      expect(Validators.isValidPakistaniPhone('0211234567'), isFalse);
      expect(Validators.isValidPakistaniPhone('0300123456'), isFalse);
      expect(Validators.isValidPakistaniPhone('+913001234567'), isFalse);
      expect(Validators.isValidPakistaniPhone(''), isFalse);
    });

    test('normalizes local 03XX number to +923XX', () {
      expect(
        Validators.normalizePakistaniPhone('03001234567'),
        '+923001234567',
      );
      expect(
        Validators.normalizePakistaniPhone('+923001234567'),
        '+923001234567',
      );
    });

    test('validates 6-digit OTP', () {
      expect(Validators.isValidOtp('123456'), isTrue);
      expect(Validators.isValidOtp('12345'), isFalse);
      expect(Validators.isValidOtp('12345a'), isFalse);
    });
  });
}
