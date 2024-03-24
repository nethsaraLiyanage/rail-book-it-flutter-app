import 'package:flutter/material.dart';

import 'package:railway/widgets/app_bar_title.dart';
import 'package:railway/widgets/app_bar_buttons.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var appBarHeight = height * 0.25;

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: width,
              height: appBarHeight,
              color: const Color.fromARGB(240, 199, 198, 198),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [AppBarTitle(), AppBarButtons()],
              ),
            ),
            Stack(
              children: [
                SizedBox(
                  width: width,
                  height: height - appBarHeight - 57,
                  child: Image.asset(
                    'assets/images/main.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.train_outlined), label: 'Book Now'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'Train Schedule'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined), label: 'Manage Bookings'),
        ],
      ),
    );
  }
}
