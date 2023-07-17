class FormValidation {
  static String? emaiValidation(String? value, String hintText) {
    if (value == null || value.isEmpty) {
      return "$hintText is required";
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return "Enter Correct Email Address";
    }
    return null;
  }

  static String? passwordValidation(String? value, String hintText) {
    if (value == null || value.isEmpty) {
      return "$hintText is required";
    }
    if (value.length < 6) {
      return "Minimum password length is 6.";
    } else if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return "Password should contain at least one letter";
    } else if (!RegExp(r'\d').hasMatch(value)) {
      return "Password should contain at least one digit";
    }

    return null;
  }
}
