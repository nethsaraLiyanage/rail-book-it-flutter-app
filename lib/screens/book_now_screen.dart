import 'package:flutter/material.dart';

import 'package:railway/widgets/enter_date.dart';
import 'package:railway/widgets/enter_station.dart';

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

    final fromController = TextEditingController();
    final toController = TextEditingController();
    final departureController = TextEditingController();
    final returnController = TextEditingController();

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
                height: height - 125 - 90,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: containerWidth * 0.5,
                      child: Column(
                        //Left column in big white box
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                EnterStation(
                                  textController: fromController,
                                  title: 'From',
                                ),
                                const Icon(
                                  Icons.train_rounded,
                                  size: 40,
                                ),
                                EnterStation(
                                  textController: toController,
                                  title: 'To',
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                EnterDate(
                                  textController: departureController,
                                  title: 'Departure Date',
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                EnterDate(
                                  textController: returnController,
                                  title: 'Return Date',
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Padding(
                            padding: EdgeInsets.only(left: 16.0),
                            child: Text('Class'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(right: 8),
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    child: Text('First Class'),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(left: 8),
                                  width: 250,
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.grey,
                                    ),
                                    onPressed: () {},
                                    child: Text('Second Class'),
                                  ),
                                )
                              ],
                            ),
                          )
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
                  onPressed: () {},
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
