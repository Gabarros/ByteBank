import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label, hint;
  final IconData icon;

  Editor({
    this.controller,
    this.label,
    this.hint,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 40, top: 20),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint,
        ),
        keyboardType: TextInputType.number,
        maxLength: 6,
      ),
    );
  }
}
