import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.windowHeight,
    required this.windowWidth,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  final double windowHeight;
  final double windowWidth;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: windowHeight * 0.06,
      width: windowWidth * 0.5,
      color: Colors.black,
      child: TextButton(
        onPressed: onPressed as void Function(),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: windowHeight * 0.02,
          ),
        ),
      ),
    );
  }
}
