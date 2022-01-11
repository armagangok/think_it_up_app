import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool? isObsecure;
  final Function? validate;
  final Function valueCatcher;
  final String? hintText;
  final TextInputType? inputType;
  final int? maxLines;
  final IconButton? iconButton;
  final bool boolean;

  const CustomTextField({
    Key? key,
    this.isObsecure,
    this.validate,
    required this.valueCatcher,
    this.hintText,
    this.inputType,
    this.maxLines,
    this.iconButton,
    required this.boolean,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextFormField(
        style: const TextStyle(color: Colors.black, fontSize: 14),
        maxLines: widget.maxLines,
        // onChanged: (value) => setState(() => widget.valueCatcher(value)),
        obscureText: _passwordVisible,
        keyboardType: widget.inputType,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(color: Colors.black),
          suffixIcon: IconButton(
            padding: EdgeInsets.zero,
            
            icon: Icon(
              widget.boolean ? _passwordVisible ? Icons.visibility_off : Icons.visibility : null,              
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
              if (widget.boolean == true) {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              } else {}
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

