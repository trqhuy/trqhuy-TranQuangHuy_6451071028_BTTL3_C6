import 'package:flutter/material.dart';
import '../models/interest_item.dart';
import '../widgets/section_header.dart';
import '../utils/validators.dart';

class SurveyView extends StatefulWidget {
  const SurveyView({super.key});

  @override
  State<SurveyView> createState() => _SurveyViewState();
}

class _SurveyViewState extends State<SurveyView> {
  // Dữ liệu sở thích
  final List<InterestItem> _interests = [
    InterestItem(title: "Phim ảnh (Movies)", icon: Icons.movie),
    InterestItem(title: "Thể thao (Sports)", icon: Icons.sports_basketball),
    InterestItem(title: "Âm nhạc (Music)", icon: Icons.music_note),
    InterestItem(title: "Du lịch (Travel)", icon: Icons.card_travel),
  ];

  // Dữ liệu hài lòng
  String _satisfaction = "Hài lòng (Satisfied)";
  bool _showError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thông tin sinh viên
            Center(
              child: Text(
                "MSSV: 6451071028 - Trần Quang Huy",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue.shade900),
              ),
            ),
            const Divider(),

            const SectionHeader("Sở thích (Interests)"),
            ..._interests.map((item) => CheckboxListTile(
              secondary: Icon(item.icon),
              title: Text(item.title),
              value: item.isSelected,
              onChanged: (val) {
                setState(() {
                  item.isSelected = val!;
                  _showError = false; // Ẩn lỗi khi user tương tác
                });
              },
            )),

            const SectionHeader("Mức độ hài lòng (Satisfaction Level)"),
            RadioListTile(
              title: const Text("Hài lòng (Satisfied)"),
              value: "Hài lòng (Satisfied)",
              groupValue: _satisfaction,
              onChanged: (val) => setState(() => _satisfaction = val!),
            ),
            RadioListTile(
              title: const Text("Bình thường (Neutral)"),
              value: "Bình thường (Neutral)",
              groupValue: _satisfaction,
              onChanged: (val) => setState(() => _satisfaction = val!),
            ),
            RadioListTile(
              title: const Text("Chưa hài lòng (Unsatisfied)"),
              value: "Chưa hài lòng (Unsatisfied)",
              groupValue: _satisfaction,
              onChanged: (val) => setState(() => _satisfaction = val!),
            ),

            // Widget hiển thị lỗi Validate như trong ảnh mẫu
            if (_showError)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.red.shade200),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.error, color: Colors.red),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Validate", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
                        Text("Bạn phải chọn ít nhất 1 sở thích", style: TextStyle(color: Colors.red, fontSize: 12)),
                      ],
                    )
                  ],
                ),
              ),

            const SectionHeader("Ghi chú thêm (Additional Notes)"),
            const TextField(
              decoration: InputDecoration(
                hintText: "Ghi chú thêm...",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade600,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  final isValid = Validators.hasAtLeastOneSelected(
                    _interests.map((e) => e.isSelected).toList(),
                  );
                  if (!isValid) {
                    setState(() => _showError = true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Gửi khảo sát thành công!')),
                    );
                  }
                },
                child: const Text("Gửi Khảo Sát", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}