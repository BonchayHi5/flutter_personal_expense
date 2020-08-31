import 'package:flutter/material.dart';
import 'package:personal_expenses_app/constants/constants.dart';

class ReuseTextField extends StatelessWidget {
  ReuseTextField(
      {this.controller,
      this.onChanged,
      this.hintText,
      this.onSaved,
      this.labelText,
      this.validator,
      this.keyboardType});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final TextInputType keyboardType;
  final String hintText;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kDefaultRadius),
            borderSide: BorderSide(color: kDefaultColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kDefaultRadius),
            borderSide: BorderSide(color: kDefaultFocusColor),
          ),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
