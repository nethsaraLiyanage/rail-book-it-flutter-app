import 'package:flutter/material.dart';

class EnterStation extends StatelessWidget {
  const EnterStation({
    super.key,
    required this.textController,
    required this.title,
  });

  final String title;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
            decoration: const InputDecoration(border: InputBorder.none),
            controller: textController,
          ),
        ),
      ],
    );
  }
}
