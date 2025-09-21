import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';

class EditUsernameScreen extends StatefulWidget {
  @override
  _EditUsernameScreenState createState() => _EditUsernameScreenState();
}

class _EditUsernameScreenState extends State<EditUsernameScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userProfile = Provider.of<UserProfileProvider>(
      context,
      listen: false,
    );
    _controller.text = userProfile.username;

    return Scaffold(
      appBar: AppBar(title: const Text("เปลี่ยน Username")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Edit Username",
                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                userProfile.changeUsername(_controller.text);
                Navigator.pop(context); // กลับไปหน้าหลัก
              },
              child: const Text("บันทึก"),
            ),
          ],
        ),
      ),
    );
  }
}
