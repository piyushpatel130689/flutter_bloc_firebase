import 'package:flutter/material.dart';
import 'package:piyush_flutter_bloc/common/common.dart';

class AuthTextField extends StatelessWidget {
  final String labelText;
  final String hint;
  final ValueChanged<String> onChanged;
  final TextInputType keyboardType;
  final bool isPasswordField;
  final bool isRequiredField;
  final String? error;
  final EdgeInsets padding;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;

  const AuthTextField(
      {required Key key,
      this.hint = '',
      required this.labelText,
      required this.onChanged,
      required this.keyboardType,
      this.isPasswordField = false,
      this.isRequiredField = false,
      this.error,
      this.padding = const EdgeInsets.all(0),
      required this.textInputAction,
      this.suffixIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    UnderlineInputBorder border = UnderlineInputBorder(
        borderSide: new BorderSide(color: Colors.blueAccent, width: 2));
    UnderlineInputBorder errorBorder = UnderlineInputBorder(
        borderSide: new BorderSide(color: Colors.redAccent, width: 2));

    return Padding(
      padding: padding,
      child: TextFormField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
            hintStyle: MyStyles.fontRegularText(),
            labelStyle: MyStyles.fontRegularText(),
            labelText: labelText,
            // fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(horizontal: 12),
            filled: true,
            hintText: isRequiredField ? '$hint*' : hint,
            errorText: error,
            suffixIcon: suffixIcon),
        // decoration: InputDecoration(
        //   labelText: labelText,
        //   fillColor: Colors.white,
        //   contentPadding: EdgeInsets.symmetric(horizontal: 12),
        //   filled: true,
        //   hintText: isRequiredField ? '$hint*' : hint,
        //   border: border,
        //   disabledBorder: border,
        //   enabledBorder: border,
        //   errorBorder: errorBorder,
        //   focusedErrorBorder: errorBorder,
        //   errorText: error,
        //   floatingLabelBehavior: FloatingLabelBehavior.never,
        // ),
        autocorrect: false,
        textInputAction: textInputAction,
        obscureText: isPasswordField,
        maxLines: 1,
        onChanged: onChanged,
      ),
    );
  }
}
