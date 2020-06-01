class Utils {
  static String getNameFromEmail(String email) {
    final endIndex = email.indexOf('@');
    return email.substring(0, endIndex);
  }
}
