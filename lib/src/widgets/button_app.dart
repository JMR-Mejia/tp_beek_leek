import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  Color color;
  Color textColor;
  String text;
  Function onPressed;

  ButtonApp({
    Key? key,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    required this.text,
    required this.onPressed,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.center,
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NimbusSans',
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.02,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}