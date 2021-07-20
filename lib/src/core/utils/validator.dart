class Validator {
  Validator._();

  static bool isOtpNumber(String otp, {int length = 6}) {
    if (otp.isEmpty) return false;
    if (!isNumeric(otp)) return false;
    if (otp.length != length) {
      return false;
    }
    return true;
  }

  static bool isNumeric(String string) {
  if (string.isEmpty) {
    return false;
  }
  final number = num.tryParse(string);
  if (number == null) {
    return false;
  }
  return true;
}
}
