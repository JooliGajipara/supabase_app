import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/constants.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({
    Key? key,
    required this.size,
    GlobalKey<FormState>? formKey,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final Size size;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(width: size.width, height: 45),
      child: ElevatedButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  side: BorderSide(color: Colors.transparent))),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
