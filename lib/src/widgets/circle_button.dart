import 'package:flutter/material.dart';

class CircleButton extends StatefulWidget {
  final bool mini;
  final IconData icon;
  final double iconSize;
  final Color color;
  final VoidCallback onPressed;

  const CircleButton(
      this.mini, this.icon, this.iconSize, this.color, this.onPressed,
      {Key? key})
      : super(key: key);

  @override
  State<CircleButton> createState() => _CircleButtonState();
}

class _CircleButtonState extends State<CircleButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FloatingActionButton(
        backgroundColor: widget.color,
        mini: widget.mini,
        onPressed: widget.onPressed,
        child: Icon(
          widget.icon,
          size: widget.iconSize,
          color: Color(0xFF4268D3),
        ),
        heroTag: null,
      )
    );
  }
}
