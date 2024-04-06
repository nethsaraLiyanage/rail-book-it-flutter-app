import 'package:flutter/material.dart';

class DropDownBox extends StatelessWidget {
  const DropDownBox({
    super.key,
    required this.containerHeight,
    required this.dropDownList,
    required this.dropdownValue,
  });

  final double containerHeight;
  final String dropdownValue;
  final List<String> dropDownList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: containerHeight * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Expiry Month',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                ),
          ),
          Container(
            width: 150,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: DropdownButton(
              value: dropdownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: dropDownList.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
          ),
        ],
      ),
    );
  }
}
