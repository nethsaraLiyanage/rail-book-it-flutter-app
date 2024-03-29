import 'package:flutter/material.dart';

class FromToWidget extends StatelessWidget {
  const FromToWidget({
    super.key,
    required this.fromController,
    required this.toController,
  });

  final fromController;
  final toController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('From'),
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 40,
                width: 240,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: fromController,
                ),
              ),
            ],
          ),
          const Icon(Icons.train_rounded, size: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('To'),
              Container(
                margin: const EdgeInsets.only(top: 8),
                height: 40,
                width: 240,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: TextField(
                  controller: toController,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
