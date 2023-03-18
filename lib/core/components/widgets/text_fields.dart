import 'dart:developer';

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String? initialValue;
  final bool? isObsecure;
  final TextInputType? inputType;
  final int? maxLines;
  final IconButton? iconButton;
  final bool isObscure;
  final double? height;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    this.initialValue,
    this.isObsecure,
    this.inputType,
    this.maxLines,
    this.iconButton,
    this.isObscure = false,
    this.height,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: widget.initialValue,
      controller: widget.controller,
      style: const TextStyle(color: Colors.black, fontSize: 14),
      maxLines: widget.maxLines,
      textAlign: TextAlign.start,
      obscureText: _passwordVisible,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.black),
        suffixIcon: IconButton(
          padding: EdgeInsets.zero,
          icon: NewWidget(widget: widget, passwordVisible: _passwordVisible),
          onPressed: () {
            if (widget.isObscure == true) {
              setState(() => _passwordVisible = !_passwordVisible);
            }
          },
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.widget,
    required bool passwordVisible,
  })  : _passwordVisible = passwordVisible,
        super(key: key);

  final CustomTextField widget;
  final bool _passwordVisible;

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.isObscure
          ? _passwordVisible
              ? Icons.visibility_off
              : Icons.visibility
          : null,
      color: Theme.of(context).primaryColorDark,
    );
  }
}
