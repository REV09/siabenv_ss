import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final double width;
  final double height;
  final String textButton;
  final IconData? icon;
  final double? iconSize;
  final BoxDecoration boxDecoration;

  const OptionButton({
    Key? key,
    required this.width,
    required this.height,
    required this.textButton,
    this.icon,
    this.iconSize,
    required this.boxDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: boxDecoration,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: width,
          height: height,
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
      ),
    );
  }
}
