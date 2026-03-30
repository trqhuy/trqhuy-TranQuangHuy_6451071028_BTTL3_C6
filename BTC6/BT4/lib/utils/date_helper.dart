import 'package:flutter/material.dart';

class DateHelper {
  // Định dạng ngày sang String để hiển thị
  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  // Định dạng giờ sang String
  static String formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  // Validate: Không cho phép ngày trong quá khứ
  static String? validateDate(DateTime? date) {
    if (date == null) return "Vui lòng chọn ngày";
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    if (date.isBefore(today)) {
      return "Ngày không hợp lệ (trong quá khứ)";
    }
    return null;
  }
}