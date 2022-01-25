import 'package:flutter/material.dart';

class AuthTextField extends StatefulWidget {
  final String? initialValue;
  final bool? isObsecure;
  final TextInputType? inputType;
  final IconButton? iconButton;
  final bool boolean;
  final double? height;
  final TextEditingController controller;

  const AuthTextField({
    Key? key,
    this.initialValue,
    this.isObsecure,
    this.inputType,
    this.iconButton,
    required this.boolean,
    this.height,
    required this.controller,
  }) : super(key: key);

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextFormField(
        initialValue: widget.initialValue,
        controller: widget.controller,
        style: const TextStyle(color: Colors.black, fontSize: 14),
        maxLines: 1,
        textAlign: TextAlign.start,
        obscureText: _passwordVisible,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintStyle: const TextStyle(color: Colors.black),
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            icon: NewWidget(widget: widget, passwordVisible: _passwordVisible),
            onPressed: () {
              if (widget.boolean == true) {
                setState(() => _passwordVisible = !_passwordVisible);
              }
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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

  final AuthTextField widget;
  final bool _passwordVisible;

  @override
  Widget build(BuildContext context) {
    return Icon(
      widget.boolean
          ? _passwordVisible
              ? Icons.visibility_off
              : Icons.visibility
          : null,
      color: Theme.of(context).primaryColorDark,
    );
  }
}
