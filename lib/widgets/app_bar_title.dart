import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 95,
                width: 95,
                child: Image.asset(
                  'assets/images/logo.jpg',
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Rail Bookit',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.aBeeZee.toString(),
                      fontSize: 32,
                      color: const Color.fromARGB(255, 1, 130, 117),
                    ),
              ),
            ],
          ),
          Text(
            'Start Your Journey Today',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: const Color.fromARGB(255, 1, 130, 117),
                ),
          )
        ],
      ),
    );
  }
}
