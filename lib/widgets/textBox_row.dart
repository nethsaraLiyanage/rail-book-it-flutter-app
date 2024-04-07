import 'package:flutter/material.dart';

class TextBoxRow extends StatelessWidget {
  const TextBoxRow({
    super.key,
    required this.title,
    required this.infoController,
  });

  final String title;
  final TextEditingController infoController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 20,
              ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          height: 40,
          width: 240,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: TextField(
            controller: infoController,
          ),
        ),
      ],
    );
  }
}
