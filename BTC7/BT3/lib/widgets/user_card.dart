import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      elevation: 4,
      child: ListTile(
        leading: Icon(Icons.person, color: Colors.deepPurple),
        title: Text("Trần Quang Huy"),
        subtitle: Text("MSSV: 6451071028"),
      ),
    );
  }
}