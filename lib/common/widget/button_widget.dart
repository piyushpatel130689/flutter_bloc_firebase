import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class ElevatedButtonCustomWidget extends StatelessWidget {
  final Icon? icon;
  final String text;
  final Function() onPressed;
  final bool widthFull;

  ElevatedButtonCustomWidget(
      {this.icon,
      required this.text,
      required this.onPressed,
      this.widthFull = true});

  @override
  Widget build(BuildContext context) {
    if (this.icon != null) {
      return (this.widthFull != null && this.widthFull)
          ? Flexible(
              child: ElevatedButton.icon(
              label: Text(this.text),
              icon: icon ??
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
              onPressed: this.onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shadowColor: Colors.red,
                  elevation: 5,
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 10)),
            ))
          : ElevatedButton.icon(
              label: Text(this.text),
              icon: icon ??
                  Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
              onPressed: this.onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shadowColor: Colors.red,
                  elevation: 5,
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 10)),
            );
    } else {
      return (this.widthFull != null && this.widthFull)
          ? Flexible(
              child: ElevatedButton(
              child: Text(this.text),
              onPressed: this.onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shadowColor: Colors.red,
                  elevation: 5,
                  fixedSize: Size(MediaQuery.of(context).size.width, 10)),
            ))
          : ElevatedButton(
              child: Text(this.text),
              onPressed: this.onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shadowColor: Colors.red,
                  elevation: 5,
                  fixedSize: Size(MediaQuery.of(context).size.width / 2, 10)),
            );
    }
  }
}
