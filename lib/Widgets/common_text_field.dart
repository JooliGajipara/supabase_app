import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? textEditingController;
  final String? labelText;
  final String? validationMsg;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isTextObscured;

  const CommonTextField({
    Key? key,
    this.textEditingController,
    this.labelText,
    this.validationMsg,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.isTextObscured = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      controller: textEditingController,
      keyboardType: keyboardType,
      obscureText: isTextObscured,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMsg;
        }
        return null;
      },
      onChanged: (text) {
        if (onChanged != null) {
          onChanged!(text);
        }
      },
    );
  }
}
