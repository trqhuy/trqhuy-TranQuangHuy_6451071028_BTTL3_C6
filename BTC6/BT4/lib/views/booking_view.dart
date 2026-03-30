import 'package:flutter/material.dart';
import '../utils/date_helper.dart';
import '../widgets/custom_picker_field.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedService = 'Kiểm tra tổng quát';
  String? _dateError;

  // Hàm gọi DatePicker
  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateError = DateHelper.validateDate(picked);
      });
    }
  }

  // Hàm gọi TimePicker
  Future<void> _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ĐẶT LỊCH HẸN'),
        backgroundColor: const Color(0xFF1A3D37),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // MSSV hiển thị trên giao diện
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              color: Colors.orange.shade50,
              child: const Text(
                "MSSV: 6451071028 - Trần Quang Huy",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey),
              ),
            ),
            const SizedBox(height: 20),

            CustomPickerField(
              label: "Chọn ngày",
              value: _selectedDate == null ? "Select Date" : DateHelper.formatDate(_selectedDate!),
              icon: Icons.calendar_today_outlined,
              onTap: _pickDate,
              errorText: _dateError,
            ),

            CustomPickerField(
              label: "Chọn giờ",
              value: _selectedTime == null ? "Chọn giờ" : DateHelper.formatTime(_selectedTime!),
              icon: Icons.access_time,
              onTap: _pickTime,
            ),

            const Text("Chọn dịch vụ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: _selectedService,
              decoration: const InputDecoration(border: OutlineInputBorder()),
              items: ['Kiểm tra tổng quát', 'Dịch vụ 2', 'Dịch vụ 3'].map((s) {
                return DropdownMenuItem(value: s, child: Text(s));
              }).toList(),
              onChanged: (val) => setState(() => _selectedService = val!),
            ),

            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {
                  setState(() => _dateError = DateHelper.validateDate(_selectedDate));
                  if (_dateError == null && _selectedDate != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đặt lịch thành công!')),
                    );
                  }
                },
                child: const Text("Xác nhận Đặt lịch",
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}