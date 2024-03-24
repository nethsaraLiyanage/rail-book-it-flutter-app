import 'package:flutter/material.dart';

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    String dropDownValue = 'English';

    const dropDownItems = [
      'English',
      'Sinhala',
    ];
    return SizedBox(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Log In',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                      fontSize: 20,
                    ),
              ),
            ),
          ),
          Container(
            width: 150,
            height: 35,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: DropdownButton(
              style: const TextStyle(color: Colors.white),
              value: dropDownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: dropDownItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? newValue) {},
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_2_outlined))
        ],
      ),
    );
  }
}
