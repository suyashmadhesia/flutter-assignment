import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? textController;
  final String? Function(String?)? validator;
  final String? hintText;
  final String? helperText;
  final TextAlign textAlignment;
  final TextInputType keyboard;
  final Widget? preffixWidget;
  final bool readOnly;
  final void Function(String)? onChanged;
  final String? label;
  final int? maxLines;
  final int? maxLength;
  final int? minLines;
  final Color fillColor;
  final double borderWidth;
  final BorderStyle borderStyle;
  final Color borderColor;
  const CustomTextField(
      {super.key,
      required this.textAlignment,
      this.onChanged,
      this.maxLines = 1,
      this.maxLength,
      this.minLines = 1,
      this.readOnly = false,
      this.preffixWidget,
      this.helperText,
      @required this.hintText,
      this.textController,
      this.validator,
      this.label,
      this.fillColor = Colors.white,
      this.borderWidth = 2,
      this.borderColor = Colors.blue,
      this.borderStyle = BorderStyle.solid,
      this.keyboard = TextInputType.name});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      keyboardType: keyboard,
      textAlign: textAlignment,
      maxLength: maxLength,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      controller: textController,
      cursorColor: Colors.black,
      autofocus: false,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
      decoration: InputDecoration(
        prefixIcon: preffixWidget,
        filled: true,
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
              width: borderWidth, style: borderStyle, color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
              width: borderWidth, style: borderStyle, color: borderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
              width: borderWidth, style: borderStyle, color: borderColor),
        ),
        labelText: label,
        labelStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.normal, color: Colors.grey),
      ),
    );
  }
}
