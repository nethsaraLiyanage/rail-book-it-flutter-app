import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railway/providers/language_provider.dart';

import 'package:railway/screens/pay_confirm_screen.dart';
import 'package:railway/widgets/pay_detail_row.dart';
import 'package:railway/widgets/titled_textBox.dart';

class PayScreen extends ConsumerStatefulWidget {
  const PayScreen({super.key});

  @override
  ConsumerState<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends ConsumerState<PayScreen> {
  String expiryMonthValue = 'MM';
  final expiryMonths = [
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
  final expiryYears = [
    'YY',
    '2024',
    '2025',
    '2026',
    '2027',
    '2028',
  ];
  Color masterColor = Colors.transparent;
  Color visaColor = Colors.transparent;

  void onCardSelection(String cardType) {
    if (cardType == 'master') {
      setState(() {
        visaColor = Colors.transparent;
        masterColor = Colors.green;
      });
    }
    if (cardType == 'visa') {
      setState(() {
        masterColor = Colors.transparent;
        visaColor = Colors.green;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var containerWidth = width * 0.9;
    var containerHeight = height - 125 - 90;
    var columnWidth = containerWidth * 0.5;
    var payContainerWidth = columnWidth * 0.8;
    var payContainerHeight = containerHeight * 0.8;
    var payRowTop = payContainerHeight * 0.05;

    final cardNumberController = TextEditingController();
    final cardHolderController = TextEditingController();

    var language = ref.watch(languageProvider);

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
                            language == 'Sinhala'
                                ? 'චාරිකා විස්තර'
                                : 'Jounrney Details',
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
                                  parameter:
                                      language == 'Sinhala' ? 'සිට:' : 'From:',
                                  data: language == 'Sinhala'
                                      ? 'මහනුවර'
                                      : 'Kandy',
                                  height: height,
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter:
                                      language == 'Sinhala' ? 'දක්වා:' : 'To:',
                                  data: language == 'Sinhala'
                                      ? 'කොළඹ'
                                      : 'Colombo',
                                  height: height,
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: language == 'Sinhala'
                                      ? 'මගීන් ගණන:'
                                      : 'Passenger Count:',
                                  data: '1',
                                  height: height,
                                ),
                                SizedBox(height: payRowTop * 1.5),
                                Text(
                                  language == 'Sinhala' ? 'ගෙවීම' : 'Payment',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(fontSize: height * 0.031),
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: language == 'Sinhala'
                                      ? 'ටිකට් මුදල'
                                      : 'Ticket Amount',
                                  data: 'Rs. ${1000}',
                                  height: height,
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: language == 'Sinhala'
                                      ? 'මගීන් ගණන:'
                                      : 'No of Passengers',
                                  data: '${1}',
                                  height: height,
                                ),
                                PayDetailRow(
                                  top: payRowTop,
                                  parameter: language == 'Sinhala'
                                      ? 'මුලු වටිනාකම:'
                                      : 'Total Amount',
                                  data: 'Rs. ${1000}',
                                  height: height,
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
                            title: language == 'Sinhala'
                                ? 'කාඩ්පත් අංකය'
                                : 'Card Number',
                            textController: cardNumberController,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              InkWell(
                                onTap: () {
                                  onCardSelection('master');
                                },
                                child: Container(
                                  color: masterColor,
                                  height: 40,
                                  width: 60,
                                  child:
                                      Image.asset('assets/images/master.png'),
                                ),
                              ),
                              const SizedBox(width: 10),
                              InkWell(
                                onTap: () {
                                  onCardSelection('visa');
                                },
                                child: Container(
                                  color: visaColor,
                                  height: 40,
                                  width: 60,
                                  child: Image.asset('assets/images/visa.png'),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: containerHeight * 0.15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      language == 'Sinhala'
                                          ? 'කල් ඉකුත්වන මාසය'
                                          : 'Expiry Month',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: height * 0.025,
                                          ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: DropdownButton(
                                        value: expiryMonthValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        underline: Container(height: 0),
                                        items: expiryMonths.map((String item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            expiryMonthValue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                height: containerHeight * 0.15,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      language == 'Sinhala'
                                          ? 'කල් ඉකුත්වන වසර'
                                          : 'Expiry Year',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: height * 0.025,
                                          ),
                                    ),
                                    Container(
                                      width: 150,
                                      height: 35,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: DropdownButton(
                                        value: expiryYearValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        underline: Container(height: 0),
                                        items: expiryYears.map((String item) {
                                          return DropdownMenuItem(
                                            value: item,
                                            child: Text(item),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          expiryYearValue = newValue!;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          TitledTextBox(
                            title: language == 'Sinhala'
                                ? 'කාඩ්පත් හිමියාගේ නම'
                                : 'Cardholder Name',
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
                              child:
                                  Text(language == 'Sinhala' ? 'ගෙවීම' : 'Pay'),
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
                  child: Text(language == 'Sinhala' ? 'ආපසු' : 'Back'),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
