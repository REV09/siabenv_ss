import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  final TextInputType keyboardType;
  final bool obscureText;
  final String label;
  final bool borderEnabled;
  final double fontSize;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? helperText;
  final Widget? suffixIcon;
  const InputText({
    Key? key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.borderEnabled = true,
    this.helperText,
    this.suffixIcon,
    required this.fontSize,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle emailAdressLabel = TextStyle(
        color: Colors.black, fontWeight: FontWeight.w400, fontSize: fontSize);

    TextStyle textFieldStyleFont = TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: fontSize + 3);

    InputDecoration inputDecoration = InputDecoration(
      labelText: label,
      labelStyle: emailAdressLabel,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      helperText: helperText,
      suffixIcon: Align(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: suffixIcon,
      ),
    );
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      decoration: inputDecoration,
      style: textFieldStyleFont,
    );
  }
}
