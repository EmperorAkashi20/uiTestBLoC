import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  AddButton({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
    required this.onPressed,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;
  final Function onPressed;
  Color color = Colors.grey.shade300;
  int pressed = 1;
  String text = 'Add';

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.pressed == 1) {
          setState(() {
            widget.color = Colors.yellow;
            widget.text = 'Added';
            widget.pressed = 2;
          });
        } else if (widget.pressed == 2) {
          setState(() {
            widget.color = Colors.grey.shade300;
            widget.text = 'Add';
            widget.pressed = 1;
          });
        }
      },
      child: Container(
        height: widget.windowHeight * 0.04,
        width: widget.windowWidth * 0.2,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: widget.windowHeight * 0.02,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
