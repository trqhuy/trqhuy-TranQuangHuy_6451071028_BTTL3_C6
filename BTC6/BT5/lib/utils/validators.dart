class Validators {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Vui lòng nhập email';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Email không hợp lệ';
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Vui lòng nhập họ và tên';
    return null;
  }
}