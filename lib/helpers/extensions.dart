extension StringExtension on String? {
  bool isEmailValid() {
    if (this != null) {
      final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
      return regex.hasMatch(this!);
    } else {
      return false;
    }
  }
}
