import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {

   CustomTextForm({
    this.icon,
    required this.label,
    this.validator,
    this.obscureText = false,
    this.controller,
    this.onChanged
    });

   IconData? icon;
   final String label;
   String? Function (String? text)? validator;
   bool obscureText;
   TextEditingController? controller;
   String? Function (String? text)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              controller: controller,
              validator: validator,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              onChanged: onChanged,
              obscureText: obscureText,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  prefixIcon: Icon(icon),
                  label: Text(
                    label,
                    style:const TextStyle(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 2, color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)
                      )
                    )
                  );
  }
}