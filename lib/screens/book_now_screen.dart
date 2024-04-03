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
    var containerHeight = height - 125 - 90;

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
                height: containerHeight,
                width: containerWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: containerWidth * 0.5,
                      height: containerHeight,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Column(
                          //Left column in big white box
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
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
                            const SizedBox(height: 10),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Class'),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
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
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      SizedBox(
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
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: 250,
                                    height: 40,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.grey,
                                      ),
                                      onPressed: () {},
                                      child: Text('Third Class'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text('Number of Passengers'),
                            Row(
                              children: [
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(color: Colors.grey),
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(Icons.remove)),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 40,
                                  width: 40,
                                  child: Text('1'),
                                ),
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(color: Colors.grey),
                                  child: IconButton(
                                      onPressed: () {}, icon: Icon(Icons.add)),
                                ),
                              ],
                            )
                          ],
                        ),
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
