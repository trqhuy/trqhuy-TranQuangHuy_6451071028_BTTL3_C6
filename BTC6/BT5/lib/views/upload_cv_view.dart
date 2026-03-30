import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../utils/validators.dart';
import '../widgets/custom_input_field.dart';

class UploadCvView extends StatefulWidget {
  const UploadCvView({super.key});

  @override
  State<UploadCvView> createState() => _UploadCvViewState();
}

class _UploadCvViewState extends State<UploadCvView> {
  final _formKey = GlobalKey<FormState>();
  String? _fileName;
  bool _isConfirmed = false;
  bool _fileError = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _fileError = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bài 5: Form upload hồ sơ'),
        backgroundColor: const Color(0xFF1A3D37),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // MSSV Hiển thị trên giao diện
              Center(
                child: Text(
                  "MSSV: 6451071028 - Trần Quang Huy",
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red.shade700, fontSize: 16),
                ),
              ),
              const Divider(height: 30),

              const CustomInputField(
                label: "Họ và tên",
                hint: "Nguyen Lan Huong",
                validator: Validators.validateName,
              ),

              const CustomInputField(
                label: "Email",
                hint: "lanhuong.nguyen@example.com",
                validator: Validators.validateEmail,
              ),

              const Text("File Picker", style: TextStyle(fontWeight: FontWeight.bold)),
              const Text("CV (Định dạng: PDF, DOCX)", style: TextStyle(fontSize: 12)),
              const SizedBox(height: 8),

              // Khu vực chọn file
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: _fileError ? Colors.red : Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: _pickFile,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300),
                      child: const Text("Chọn Tệp CV", style: TextStyle(color: Colors.black)),
                    ),
                    const SizedBox(width: 10),
                    if (_fileName != null)
                      Expanded(
                        child: Row(
                          children: [
                            const Icon(Icons.picture_as_pdf, color: Colors.red, size: 20),
                            const SizedBox(width: 5),
                            Flexible(child: Text(_fileName!, overflow: TextOverflow.ellipsis)),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              if (_fileError)
                const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text("Vui lòng upload CV của bạn!", style: TextStyle(color: Colors.red, fontSize: 12)),
                ),

              const SizedBox(height: 20),
              CheckboxListTile(
                title: const Text("Tôi xác nhận thông tin là chính xác."),
                value: _isConfirmed,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (val) => setState(() => _isConfirmed = val!),
              ),

              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() => _fileError = _fileName == null);
                    if (_formKey.currentState!.validate() && !_fileError && _isConfirmed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Hồ sơ đã được nộp!')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange.shade300,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text("Nộp Hồ Sơ", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}