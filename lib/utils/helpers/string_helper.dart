class SStringHelper {
  static bool isPalindrome(String value) {
    final cleaned = value.replaceAll(' ', '').toLowerCase();
    final reversed = cleaned.split('').reversed.join();
    return cleaned == reversed;
  }
}
