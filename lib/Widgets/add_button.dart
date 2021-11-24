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

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        height: widget.windowHeight * 0.04,
        width: widget.windowWidth * 0.2,
        decoration: BoxDecoration(
          color: isSelected == true ? Colors.yellow : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            isSelected == true ? "Added" : "Add",
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
