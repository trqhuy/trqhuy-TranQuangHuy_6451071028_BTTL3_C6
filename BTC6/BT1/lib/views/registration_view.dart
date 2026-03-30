import 'package:flutter/material.dart';
import '../utils/validators.dart';
import '../widgets/custom_text_field.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  final _formKey = GlobalKey<FormState>();
  bool _isAgreed = false;
  bool _isFormValid = false;

  // Controller hoặc biến lưu giá trị để check validate real-time
  void _updateFormState() {
    setState(() {
      _isFormValid = _formKey.currentState?.validate() ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng Ký Tài Khoản'),
        backgroundColor: const Color(0xFF1A3D37), // Màu xanh đậm như ảnh
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          onChanged: _updateFormState, // Check mỗi khi user nhập
          child: Column(
            children: [
              // Hiển thị MSSV (Thay số này bằng MSSV của bạn)
              const Text(
                "MSSV: 6451071028 - Nguyễn Văn A",
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 20),
              const Icon(Icons.account_circle, size: 80, color: Colors.blueGrey),
              const Text("Account Circle"),
              const SizedBox(height: 20),

              CustomTextField(
                label: "Họ và tên",
                hint: "Nguyen Van A",
                validator: (v) => Validators.validateEmpty(v, "họ và tên"),
              ),
              CustomTextField(
                label: "Email",
                hint: "example@domain.com",
                validator: (v) => Validators.validateEmail(v),
              ),
              CustomTextField(
                label: "Mật khẩu",
                hint: "********",
                isPassword: true,
                validator: (v) => Validators.validateEmpty(v, "mật khẩu"),
              ),

              CheckboxListTile(
                title: const Text("Tôi đồng ý với các Điều khoản & Chính sách"),
                value: _isAgreed,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (val) {
                  setState(() {
                    _isAgreed = val ?? false;
                  });
                },
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: (_isFormValid && _isAgreed) ? () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Đăng ký thành công!')),
                    );
                  } : null, // Disable nếu chưa hợp lệ
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orangeAccent,
                    disabledBackgroundColor: Colors.orangeAccent.withOpacity(0.5),
                  ),
                  child: const Text("Đăng Ký", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}