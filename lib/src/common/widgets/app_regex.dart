class AppRegex {
  static bool isEmailValid(String email) {
    return RegExp(  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email);
  }
//   static bool isValidEmail(String email) {
//   // Regular expression for validating an email
//   String emailPattern =
//       r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
//   RegExp regExp = RegExp(emailPattern);
//   return regExp.hasMatch(email);
// }

  static bool isPasswordValid(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password);
  }
}