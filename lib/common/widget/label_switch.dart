import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LinkedLabelSwitch extends StatelessWidget {
  const LinkedLabelSwitch({
    Key? key,
    required this.label,
    required this.padding,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: <Widget>[
          Expanded(
            child: RichText(
              text: TextSpan(
                text: label,
                style: const TextStyle(
                  color: Colors.blueAccent,
                  // decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('Label has been tapped.');
                  },
              ),
            ),
          ),
          Switch(
            value: value,
            onChanged: (bool newValue) {
              onChanged(newValue);
            },
          ),
        ],
      ),
    );
  }
}
