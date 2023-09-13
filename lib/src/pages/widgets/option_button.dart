import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final double width;
  final double height;
  final String textButton;
  final IconData? icon;
  final double? iconSize;

  const OptionButton({
    Key? key,
    required this.width,
    required this.height,
    required this.textButton,
    this.icon,
    this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.green.shade700),
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              child: Icon(
                icon!,
                size: iconSize,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              textButton,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
