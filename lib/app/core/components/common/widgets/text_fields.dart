import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool? isObsecure;
  final Function? validate;
  // final Function valueCatcher;
  final Icon? icon;
  final TextInputType? inputType;

  const CustomTextField({
    Key? key,
    this.isObsecure,
    this.validate,
    // required this.valueCatcher,
    this.icon,
    this.inputType,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black, fontSize: 14),
      maxLines: null,
      // onChanged: (value) => setState(() => widget.valueCatcher(value)),
      obscureText: widget.isObsecure ?? false,
      keyboardType: widget.inputType,
      decoration: InputDecoration(
        hintText: "type your idea here",
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: widget.icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
