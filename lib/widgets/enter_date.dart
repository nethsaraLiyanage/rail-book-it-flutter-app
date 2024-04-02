import 'package:flutter/material.dart';

class EnterDate extends StatelessWidget {
  const EnterDate({
    super.key,
    required this.textController,
    required this.title,
  });

  final TextEditingController textController;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          margin: const EdgeInsets.only(top: 8),
          width: 240,
          height: 40,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3, bottom: 5),
                child: SizedBox(
                  width: 180,
                  child: TextField(
                    controller: textController,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
              ),
            ],
          ),
        )
      ],
    );
  }
}
