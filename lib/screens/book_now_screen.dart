import 'package:flutter/material.dart';

import 'package:railway/screens/pay_screen.dart';
import 'package:railway/widgets/book_now_left.dart';

class BookNowScreen extends StatefulWidget {
  const BookNowScreen({super.key});

  @override
  State<BookNowScreen> createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var containerWidth = width * 0.9;
    var containerHeight = height - 125 - 90;
    var columnWidth = containerWidth * 0.5;
    var seatContainerWidth = columnWidth * 0.8;
    var seatContainerHeight = containerHeight * 0.8;

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
                            'Select Seat',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 22,
                                ),
                          ),
                          Container(
                            height: seatContainerHeight,
                            width: seatContainerWidth,
                            decoration: BoxDecoration(color: Colors.grey[200]),
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
                  child: const Text('Back'),
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
                  child: const Text('Next'),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
