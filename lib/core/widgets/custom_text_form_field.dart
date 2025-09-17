import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines,
    required this.controller,
    this.validator,
  });
  final String title;
  final String hintText;
  final int? maxLines;
  final TextEditingController controller;
  final Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffFFFCFC),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: validator != null
              ? (String? value) => validator!(value)
              : null,
          // validator: (value) {
          //   if (value?.trim().isEmpty ?? false || value == null) {
          //     return 'Please Enter Task Name';
          //   } else {
          //     return null;
          //   }
          // },
          maxLines: maxLines,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xff6D6D6D),
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            fillColor: Color(0xff282828),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xff15B86C)),
            ),
          ),
        ),
      ],
    );
  }
}
