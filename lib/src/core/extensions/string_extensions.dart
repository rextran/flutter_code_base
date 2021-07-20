extension StringExtension on String? {
  bool isPhoneNumber() {
    if (this == null) return false;
    if (this!.length < 9 || this!.length > 12) {
      return false;
    }
    return true;
  }
}
