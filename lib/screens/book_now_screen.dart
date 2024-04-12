import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railway/providers/language_provider.dart';

import 'package:railway/screens/pay_screen.dart';
import 'package:railway/widgets/book_now_left.dart';

class BookNowScreen extends ConsumerStatefulWidget {
  const BookNowScreen({super.key});

  @override
  ConsumerState<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends ConsumerState<BookNowScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var containerWidth = width * 0.9;
    var containerHeight = height - 125 - 90;
    var columnWidth = containerWidth * 0.5;
    var seatContainerWidth = columnWidth * 0.8;
    var seatContainerHeight = containerHeight * 0.8;

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
                //Big white box
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    BookNowLeft(
                      containerWidth: containerWidth,
                      containerHeight: containerHeight,
                    ),
                    SizedBox(
                      width: columnWidth,
                      height: containerHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            language == 'Sinhala'
                                ? 'ආසනය තෝරන්න'
                                : 'Select Seat',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 22,
                                  fontFamily: 'Noto Serif Sinhala',
                                ),
                          ),
                          Container(
                            height: seatContainerHeight,
                            width: seatContainerWidth,
                            decoration: BoxDecoration(color: Colors.grey[200]),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  color: Colors.white,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.green[600],
                                            width: 10,
                                            height: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Available')
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.indigo[900],
                                            width: 10,
                                            height: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Selected')
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            color: Colors.grey[400],
                                            width: 10,
                                            height: 10,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text('Unavailable')
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 20, 10, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: seatContainerWidth * 0.47,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                height: 50,
                width: 160,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 76, 228, 81)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(language == 'Sinhala' ? 'ආපසු' : 'Back'),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                height: 50,
                width: 160,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 76, 228, 81)),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => PayScreen(),
                      ),
                    );
                  },
                  child: Text(language == 'Sinhala' ? 'ඊළඟ' : 'Next'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
