import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../widgets/info_label.dart';

class PersonalInfoView extends StatefulWidget {
  const PersonalInfoView({super.key});

  @override
  State<PersonalInfoView> createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final _formKey = GlobalKey<FormState>();

  // Các biến lưu trữ giá trị form
  String _gender = 'Nam';
  String _maritalStatus = 'Kết hôn';
  double _income = 15.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FORM THÔNG TIN CÁ NHÂN'),
        backgroundColor: const Color(0xFF1A3D37),
        foregroundColor: Colors.white,
        leading: const Icon(Icons.arrow_back),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Thông tin sinh viên
              Center(
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.yellow.shade100),
                  child: const Text(
                    "MSSV: 6451071028 - Trần Quang Huy",
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ),

              const InfoLabel("Họ và tên"),
              TextFormField(
                decoration: const InputDecoration(hintText: "Nhập tên của bạn"),
                validator: Validators.validateName,
              ),

              const InfoLabel("Tuổi"),
              TextFormField(
                decoration: const InputDecoration(hintText: "Nhập tuổi của bạn"),
                keyboardType: TextInputType.number,
                validator: Validators.validateAge,
              ),

              const InfoLabel("Giới tính"),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['Nam', 'Nữ', 'Khác'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (val) => setState(() => _gender = val!),
              ),

              const InfoLabel("Tình trạng hôn nhân"),
              RadioListTile<String>(
                title: const Text("Độc thân"),
                value: "Độc thân",
                groupValue: _maritalStatus,
                onChanged: (val) => setState(() => _maritalStatus = val!),
              ),
              RadioListTile<String>(
                title: const Text("Kết hôn"),
                value: "Kết hôn",
                groupValue: _maritalStatus,
                onChanged: (val) => setState(() => _maritalStatus = val!),
              ),
              RadioListTile<String>(
                title: const Text("Ly hôn"),
                value: "Ly hôn",
                groupValue: _maritalStatus,
                onChanged: (val) => setState(() => _maritalStatus = val!),
              ),

              const InfoLabel("Mức thu nhập"),
              Center(child: Text("Mức: ${_income.toInt()} tr VND")),
              Slider(
                value: _income,
                min: 0,
                max: 30,
                divisions: 30,
                label: "${_income.toInt()} tr VND",
                onChanged: (val) => setState(() => _income = val),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("0\ntr VND"),
                  Text("10\ntr VND"),
                  Text("20\ntr VND"),
                  Text("30\ntr VND"),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF1A3D37),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Đã lưu thông tin')),
            );
          }
        },
        child: const Icon(Icons.save, color: Colors.white),
      ),
    );
  }
}