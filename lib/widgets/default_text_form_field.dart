import 'package:evently/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefaultTextFormField extends StatefulWidget {
  String hintText;
  String? prefixIcon;
  String? suffixIcon;

  void Function(String)? onChanged;
  TextEditingController? controller;
  String? Function(String?)? validator;

  bool isPassword;

  DefaultTextFormField({
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.controller,
    this.validator,
    this.isPassword = false,
  });

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool obscureText = widget.isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset('assets/icons/${widget.prefixIcon}.svg'),
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon( obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined, color: AppTheme.light.disable,),
              )
            : widget.suffixIcon != null
            ? Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset('assets/icons/${widget.suffixIcon}.svg'),
              )
            : null,
      ),

      onChanged: widget.onChanged,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: obscureText,
    );
  }
}
