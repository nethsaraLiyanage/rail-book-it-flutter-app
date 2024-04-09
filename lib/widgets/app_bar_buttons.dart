import 'package:flutter/material.dart';

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({
    super.key,
    required this.onLogIn,
    required this.logText,
    required this.onLanguageToggle,
  });

  final void Function()? onLogIn;
  final void Function(String dropDownValue, String newValue) onLanguageToggle;
  final String logText;

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
              onPressed: onLogIn,
              child: Text(
                logText,
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
            child: DropdownButton<String>(
              value: dropDownValue,
              icon: const Icon(Icons.keyboard_arrow_down),
              style: const TextStyle(color: Colors.white),
              underline: Container(height: 0),
              onChanged: (String? newValue) {
                onLanguageToggle(newValue!, dropDownValue);
              },
              items: dropDownItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                  ),
                );
              }).toList(),
            ),
          ),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_2_outlined))
        ],
      ),
    );
  }
}
