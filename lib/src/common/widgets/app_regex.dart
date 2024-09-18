class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }
  static bool isPasswordValid(String password) {
    return RegExp(
        r'^\d{6}$',
    ).hasMatch(password);
  }
}