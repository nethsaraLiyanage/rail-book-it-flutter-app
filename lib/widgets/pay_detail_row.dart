import 'package:flutter/material.dart';

class PayDetailRow extends StatelessWidget {
  const PayDetailRow(
      {super.key,
      required this.parameter,
      required this.data,
      required this.top,
      required this.height});
  final String parameter;
  final String data;
  final double top;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: top, right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            parameter,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: height * 0.03,
                ),
          ),
          Text(
            data,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: height * 0.03,
                ),
          ),
        ],
      ),
    );
  }
}
