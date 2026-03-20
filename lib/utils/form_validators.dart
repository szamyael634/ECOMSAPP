class FormValidators {
  static final RegExp _emailRegex = RegExp(
    r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
  );

  static String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Email is required';
    if (!_emailRegex.hasMatch(email)) return 'Enter a valid email address';
    return null;
  }

  static String? validateLoginPassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Password is required';
    if (password.length < 6) return 'Password must be at least 6 characters';
    return null;
  }

  static String? validateStrongPassword(String? value) {
    final password = value ?? '';
    if (password.isEmpty) return 'Password is required';
    if (password.length < 8) return 'Use at least 8 characters';
    if (!RegExp(r'[A-Z]').hasMatch(password)) return 'Include at least one uppercase letter';
    if (!RegExp(r'[a-z]').hasMatch(password)) return 'Include at least one lowercase letter';
    if (!RegExp(r'[0-9]').hasMatch(password)) return 'Include at least one number';
    return null;
  }

  static String? validateConfirmPassword({
    required String? password,
    required String? confirmPassword,
  }) {
    if ((confirmPassword ?? '').isEmpty) return 'Please confirm your password';
    if (password != confirmPassword) return 'Passwords do not match';
    return null;
  }
}
