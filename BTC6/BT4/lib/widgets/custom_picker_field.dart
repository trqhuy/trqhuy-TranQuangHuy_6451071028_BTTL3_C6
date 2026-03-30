import 'package:flutter/material.dart';

class CustomPickerField extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;
  final String? errorText;

  const CustomPickerField({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 8),
        InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            decoration: BoxDecoration(
              border: Border.all(color: errorText != null ? Colors.red : Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value.isEmpty ? "Chọn..." : value,
                    style: TextStyle(color: value.isEmpty ? Colors.grey : Colors.black)),
                Icon(icon, color: Colors.brown),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 4),
            child: Row(
              children: [
                const Icon(Icons.error, size: 16, color: Colors.red),
                const SizedBox(width: 5),
                Text(errorText!, style: const TextStyle(color: Colors.red, fontSize: 12)),
              ],
            ),
          ),
        const SizedBox(height: 16),
      ],
    );
  }
}