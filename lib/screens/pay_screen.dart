import 'package:flutter/material.dart';

import 'package:railway/screens/pay_confirm_screen.dart';
import 'package:railway/widgets/drop_down_box.dart';
import 'package:railway/widgets/pay_detail_row.dart';
import 'package:railway/widgets/titled_textBox.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({super.key});

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
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

    final cardNumberController = TextEditingController();
    final cardHolderController = TextEditingController();

    String expiryMonthValue = 'MM';
    const expiryMonths = [
      'MM',
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];

    String expiryYearValue = 'YY';
    const expiryYears = [
      'YY',
      '2024',
      '2025',
      '2026',
      '2027',
      '2028',
    ];

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
                            'Jounrney Details',
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'From:',
                                  data: 'Kandy',
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'To:',
                                  data: 'Colombo',
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'Passenger Count:',
                                  data: '1',
                                ),
                                SizedBox(height: payRowTop * 1.5),
                                Text(
                                  'Payment',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: 22),
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'Ticket Amount',
                                  data: 'Rs. ${1000}',
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'No of Passengers',
                                  data: '${1}',
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: 'Total Amount',
                                  data: 'Rs. ${1000}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: columnWidth,
                      height: containerHeight,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TitledTextBox(
                            title: 'Card Number',
                            textController: cardNumberController,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 40,
                                width: 60,
                                child: Image.asset('assets/images/master.png'),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: 40,
                                width: 60,
                                child: Image.asset('assets/images/visa.png'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              DropDownBox(
                                containerHeight: containerHeight,
                                dropDownList: expiryMonths,
                                dropdownValue: expiryMonthValue,
                              ),
                              const SizedBox(width: 10),
                              DropDownBox(
                                containerHeight: containerHeight,
                                dropDownList: expiryYears,
                                dropdownValue: expiryYearValue,
                              ),
                            ],
                          ),
                          TitledTextBox(
                            title: 'Cardholder Name',
                            textController: cardHolderController,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 50, 0),
                            height: 50,
                            width: 260,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 76, 228, 81)),
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => PayConfirmScreen(),
                                  ),
                                );
                              },
                              child: const Text('Pay'),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
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
            ],
          )
        ],
      ),
    );
  }
}
