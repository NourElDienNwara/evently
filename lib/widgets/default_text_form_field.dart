import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatelessWidget {
  String hintText;
  String? prefixIcon;
  String? suffixIcon;

  void Function(String)? onChanged;
  TextEditingController? controller;
  String? Function(String?)? validator;

  DefaultTextFormField({
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null
            ? Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset('assets/icons/$prefixIcon.svg'),
            )
            : null,
        suffixIcon: suffixIcon != null
            ? Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset('assets/icons/$suffixIcon.svg'),
            )
            : null,
      ),

      onChanged: onChanged,
      controller: controller,
      validator: validator,
    );
  }
}
