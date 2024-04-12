import 'package:flutter/material.dart';

import 'package:railway/screens/booking_confirmed_screen.dart';
import 'package:railway/screens/landing_screen.dart';
import 'package:railway/widgets/pay_detail_row.dart';

class PayConfirmScreen extends StatelessWidget {
  const PayConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var containerWidth = width * 0.9;
    var containerHeight = height - 125 - 90;
    var columnWidth = containerWidth * 0.5;
    var payContainerWidth = columnWidth * 0.8;
    var payContainerHeight = containerHeight * 0.8;
    var payRowTop = payContainerHeight * 0.06;

    void onConfirmed() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => BookingConfirmedScreen(),
        ),
      );
    }

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
                child: Row(
                  children: [
                    SizedBox(
                      width: columnWidth,
                      height: containerHeight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Payment Successful and Booking Confirmed!',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 22,
                                ),
                          ),
                          Container(
                            width: payContainerWidth,
                            height: payContainerHeight,
                            color: Colors.white,
                            margin: const EdgeInsets.all(12),
                            padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'From:',
                                  data: 'Kandy',
                                  height: height,
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'To:',
                                  data: 'Colombo',
                                  height: height,
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'Passenger Count:',
                                  data: '1',
                                  height: height,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: payRowTop, right: 50),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Departure Date/Time:',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge!
                                            .copyWith(
                                              fontSize: 20,
                                            ),
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            '2024-02-10',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontSize: 20,
                                                ),
                                          ),
                                          Text(
                                            '05:55AM',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge!
                                                .copyWith(
                                                  fontSize: 20,
                                                ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'Train',
                                  data: 'Udarata Manike Express',
                                  height: height,
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'Seat Number',
                                  data: '${12}',
                                  height: height,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: columnWidth,
                      height: containerHeight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: containerHeight * 0.9,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 50, 0),
                                  height: 50,
                                  width: 260,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 76, 228, 81)),
                                    onPressed: () {},
                                    child: const Text('Get The Ticket'),
                                  ),
                                ),
                                const SizedBox(height: 25),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 50, 0),
                                  height: 50,
                                  width: 260,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 76, 228, 81)),
                                    onPressed: onConfirmed,
                                    child:
                                        const Text('Send E-ticket Via Email'),
                                  ),
                                ),
                              ],
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
              )
            ],
          ),
        ],
      ),
    );
  }
}
