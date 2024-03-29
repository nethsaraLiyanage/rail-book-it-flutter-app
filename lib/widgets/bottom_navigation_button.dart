import 'package:flutter/material.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.buttonText,
    required this.buttonIcon,
    required this.onButtonTap,
  });

  final String buttonText;
  final Icon buttonIcon;
  final void Function() onButtonTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onButtonTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.only(top: 5),
        // height: 40,
        child: Column(
          children: [
            buttonIcon,
            Text(buttonText),
          ],
        ),
      ),
    );
  }
}
