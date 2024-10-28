import 'package:aidra_drive/core/shared/ui/theme/color_palette.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.suffixIcon,
    this.hintText,
    this.validator,
    this.controller,
    this.keyboardType,
    this.isObscure = false,
  });

  final Widget? suffixIcon;
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      controller: controller,
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
            height: 0.0,
          ),
      cursorColor: ColorPalette.darkGreen,
      decoration: InputDecoration(
        labelText: hintText,
        contentPadding: EdgeInsets.zero,
        suffixIcon: suffixIcon,
        suffixIconColor: ColorPalette.grey,
        border: const UnderlineInputBorder(),
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: ColorPalette.grey,
              height: 0.0,
            ),
      ),
      keyboardType: keyboardType,
      validator: validator,
    );
  }
}
