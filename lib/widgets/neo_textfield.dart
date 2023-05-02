import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'themes/colors.dart';

class NeoTextField extends StatefulWidget {
  TextEditingController? controller;
  TextAlign? align;
  ValueChanged<String>? onchange;
  int? maxLength;
  int? maxLines;
  FocusNode? focusNode;
  String? hint;
  TextInputType? inputType;
  Color? fillColor;
  Widget? prefixIcon;
  Widget? sufixIcon;
  Color? hintColor;
  double? radius;
  String? error;
  GestureTapCallback? ontap;
  bool readOnly;
  bool showCurson;
  VoidCallback? onComplete;
  TextInputAction? textInputAction;
  bool? enabled;
  bool obscureText;
  double? fontSize;
  Color? textColor;

  NeoTextField({
    super.key,
    this.controller,
    this.align = TextAlign.start,
    this.onchange,
    this.maxLength,
    this.maxLines,
    this.inputType,
    this.hint,
    this.prefixIcon,
    this.fillColor,
    this.sufixIcon,
    this.focusNode,
    this.hintColor,
    this.textColor,
    this.radius,
    this.error,
    this.ontap,
    this.onComplete,
    this.readOnly = false,
    this.showCurson = true,
    this.fontSize,
    this.obscureText = false,
    this.textInputAction, this.enabled,
  });

  @override
  State<NeoTextField> createState() => _NeoTextFieldState();
}

class _NeoTextFieldState extends State<NeoTextField> {
  var isShowClose = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: widget.textInputAction,
      obscureText: widget.obscureText,
      focusNode: widget.focusNode,
      textAlign: widget.align!,
      enabled: widget.enabled,

      onChanged: (text) {
        if (widget.onchange != null) {
          widget.onchange!(text);
        }
      },
      maxLength: widget.maxLength,
      cursorColor: Colors.grey,
      readOnly: widget.readOnly,
      showCursor: widget.showCurson,
      onEditingComplete: widget.onComplete,
      maxLines: widget.maxLines,
      keyboardType: widget.inputType,
      onTap: widget.ontap,
      style: TextStyle(
        fontSize: widget.fontSize ?? 16,
        fontWeight: FontWeight.normal,
        color: widget.textColor,
        fontFamily: GoogleFonts
            .poppins()
            .fontFamily,
      ),
      controller: widget.controller,
      decoration: InputDecoration(
        errorText: widget.error,
        counterText: "",
        errorStyle: TextStyle(
          color: Colors.red,
          fontFamily: GoogleFonts
              .poppins()
              .fontFamily,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        hintText: widget.hint,
        hintStyle: TextStyle(
          color: widget.hintColor ?? Colors.black,
          fontFamily: GoogleFonts
              .poppins()
              .fontFamily,
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.radius ?? 10.0),
          borderSide: BorderSide.none,
        ),
        fillColor: widget.fillColor ?? textFieldFillColor,
        filled: true,
        isDense: true,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 13, vertical: 13),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.sufixIcon,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}
