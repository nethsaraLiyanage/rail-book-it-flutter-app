import 'package:flutter/material.dart';
import 'package:railway/screens/train_schedule_screen.dart';
import 'package:railway/widgets/textBox_row.dart';

class SearchTrainScheduleScreen extends StatelessWidget {
  const SearchTrainScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var containerWidth = width * 0.9;
    var containerHeight = height - 125 - 90;

    final startStationController = TextEditingController();
    final endStationController = TextEditingController();
    final startTimeController = TextEditingController();
    final endTimeController = TextEditingController();
    final dateController = TextEditingController();

    void onSearchTrains() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => TrainScheduleScreen(),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Train Schedule',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 40,
                          ),
                    ),
                    SizedBox(
                      width: containerWidth * 0.3,
                      height: containerHeight * 0.45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextBoxRow(
                            title: 'Start Station:',
                            infoController: startStationController,
                          ),
                          TextBoxRow(
                            title: 'End Station:',
                            infoController: endStationController,
                          ),
                          TextBoxRow(
                            title: 'Start Time:',
                            infoController: startTimeController,
                          ),
                          TextBoxRow(
                            title: 'End Time:',
                            infoController: endTimeController,
                          ),
                          TextBoxRow(
                            title: 'Date:',
                            infoController: dateController,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 50,
                          width: 260,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 76, 228, 81)),
                            onPressed: onSearchTrains,
                            child: const Text('Search Trains'),
                          ),
                        ),
                        const SizedBox(
                          width: 18,
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                          height: 50,
                          width: 260,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 76, 228, 81)),
                            onPressed: () {},
                            child: const Text('Reset'),
                          ),
                        ),
                      ],
                    ),
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
          ),
        ],
      ),
    );
  }
}
