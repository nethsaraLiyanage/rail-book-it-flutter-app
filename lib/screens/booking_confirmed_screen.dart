import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:railway/providers/language_provider.dart';
import 'package:railway/screens/landing_screen.dart';

class BookingConfirmedScreen extends ConsumerWidget {
  const BookingConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var containerWidth = width * 0.9;
    var containerHeight = height - 125 - 90;

    final language = ref.watch(languageProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 22, 142, 84),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            //Logo
            height: 125,
            width: 125,
            child: Image.asset(
              'assets/images/logo.jpg',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Image.asset('assets/images/confirmed.jpg'),
                    ),
                    Text(
                      language == 'Sinhala'
                          ? 'වෙන්කරවා ගැනීම තහවුරු කර ඇත'
                          : 'Booking Confirmed',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 35,
                          ),
                    ),
                    Text(
                      language == 'Sinhala'
                          ? 'ඔබගේ විද්‍යුත් ටිකට් පත ඔබගේ විද්‍යුත් තැපෑලට යවා ඇත'
                          : 'Your E-Ticket have sent to your Email',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 35,
                          ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 50,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (ctx) => LandingScreen()),
                                  (route) => false);
                            },
                            icon: const Icon(Icons.home),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
