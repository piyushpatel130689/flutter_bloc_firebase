import 'package:flutter/material.dart';
import 'package:piyush_flutter_bloc/lib.dart';

class ElevatedButtonCustomWidget extends StatelessWidget {
  final Key? key;
  final Icon? icon;
  final String text;
  final Function()? onPressed;
  final bool widthFull;

  ElevatedButtonCustomWidget(
      {this.key,
      this.icon,
      required this.text,
      required this.onPressed,
      this.widthFull = true});

  @override
  Widget build(BuildContext context) {
    if (this.icon != null) {
      return (this.widthFull != null && this.widthFull)
          ? Flexible(
              child: ElevatedButton.icon(
              key: key,
              label: Text(
                this.text,
                style: MyStyles.fontButtonText(),
              ),
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
              key: key,
              label: Text(
                this.text,
                style: MyStyles.fontButtonText(),
              ),
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
              key: key,
              child: Text(
                this.text,
                style: MyStyles.fontButtonText(),
              ),
              onPressed: this.onPressed,
              style: ElevatedButton.styleFrom(
                  primary: Colors.indigo,
                  shadowColor: Colors.red,
                  elevation: 5,
                  fixedSize: Size(MediaQuery.of(context).size.width, 10)),
            ))
          : ElevatedButton(
              key: key,
              child: Text(
                this.text,
                style: MyStyles.fontButtonText(),
              ),
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
