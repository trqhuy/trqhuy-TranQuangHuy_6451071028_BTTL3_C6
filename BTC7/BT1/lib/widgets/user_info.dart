import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.blue.shade50,
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Sinh viên: Trần Quang Huy",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            "MSSV: 6451071028",
            style: TextStyle(color: Colors.blueGrey),
          ),
        ],
      ),
    );
  }
}