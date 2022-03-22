import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool secure;
  final Icon? icon;
  final String errMsg;
  final bool? readOnly;
  final FocusNode? fnode;

  const TextFieldWidget(
      {Key? key,
      required this.hint,
      required this.controller,
      required this.secure,
      this.icon,
      required this.errMsg,
      this.fnode,
      this.readOnly})
      : super(key: key);
  static const txtStyle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  void _viewPass() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        readOnly: widget.readOnly ?? false,
        style: const TextStyle(
            fontSize: 14, color: Colors.black87, fontWeight: FontWeight.w400),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        controller: widget.controller,
        obscureText: widget.secure == true ? _obscureText : false,
        focusNode: widget.fnode,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          suffixIcon: widget.secure == true
              ? GestureDetector(
                  onTap: () {
                    _viewPass();
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                    color: Colors.black45,
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.black26,
              width: 1.0,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.0,
            ),
          ),
          contentPadding:
              const EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              fontSize: 14, color: Colors.black38, fontWeight: FontWeight.w400),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return widget.errMsg;
          }

          return null;
        },
      ),
    );
  }
}
