import 'package:flutter/material.dart';

class TrainScheduleScreen extends StatelessWidget {
  const TrainScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var containerWidth = width * 0.9;
    var containerHeight = height - 125 - 90;

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
                  children: [],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
