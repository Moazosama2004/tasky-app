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
          style: Theme.of(
            context,
          ).textTheme.displaySmall!.copyWith(fontSize: 16),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          validator: (String? value) => validator!(value),
          maxLines: maxLines,
          style: Theme.of(context).textTheme.labelMedium,
          decoration: InputDecoration(hintText: hintText),
        ),
      ],
    );
  }
}
