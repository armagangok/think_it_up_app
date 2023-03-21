// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '/core/export/core_export.dart';

class AuthTextField extends StatefulWidget {
  final String? initialValue;
  final TextInputType? inputType;
  final double? height;
  final TextEditingController controller;
  final bool isObscure;
  final String? Function(String? text)? validator;

  const AuthTextField({
    Key? key,
    this.initialValue,
    this.inputType,
    this.height,
    required this.controller,
    this.isObscure = false,
    required this.validator,
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        autovalidateMode: AutovalidateMode.always,
        initialValue: widget.initialValue,
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
        maxLines: 1,
        textAlign: TextAlign.start,
        obscureText: _passwordVisible,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          errorStyle: const TextStyle(fontSize: 10),
          contentPadding: EdgeInsets.symmetric(
            vertical: 2.5.h,
            horizontal: 10.0.w,
          ),
          hintStyle: const TextStyle(color: Colors.black),
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: NewWidget(
              widget: widget,
              passwordVisible: _passwordVisible,
            ),
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
        validator: widget.validator,
        onSaved: (newValue) {
          print(newValue);
        },

        
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

  final AuthTextField widget;
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
