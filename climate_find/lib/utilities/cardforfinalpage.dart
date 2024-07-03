import 'package:climate_find/utilities/constants.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key, this.color, this.input, this.width, this.height})
      : super(key: key);
  final Color? color;
  final String? input;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(15), color: color),
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(10),
      constraints: BoxConstraints(
        maxHeight: height ?? double.infinity,
        maxWidth: width ?? double.infinity,
      ),
      child: Text(
        '$input',
        style: kFinalPagetext,
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  const MyCustomButton(
      {Key? key, this.text, this.enterstyle, required this.requiredjob})
      : super(key: key);

  final String? text;
  final TextStyle? enterstyle;
  final void Function()? requiredjob;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: const Color.fromARGB(255, 5, 54, 98),
      focusColor: Colors.white,
      onPressed: requiredjob,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 6,
      constraints: const BoxConstraints.tightFor(height: 56, width: 300),
      child: Text(
        '$text',
        style: enterstyle,
      ),
    );
  }
}
