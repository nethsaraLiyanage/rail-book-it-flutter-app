import 'package:flutter/material.dart';
import 'package:railway/screens/book_now_screen.dart';

import 'package:railway/widgets/app_bar_title.dart';
import 'package:railway/widgets/app_bar_buttons.dart';
import 'package:railway/widgets/bottom_navigation_button.dart';

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
                SizedBox(
                  height: height - appBarHeight - 57,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Explore Sri Lanka By Train',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                            ),
                            Text(
                              'Book Your Tickets Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Rail Bookit Self-Kiosk',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                  ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 57,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationButton(
                    buttonText: 'Home',
                    buttonIcon: const Icon(Icons.home),
                    onButtonTap: () {},
                  ),
                  BottomNavigationButton(
                    buttonText: 'Book Now',
                    buttonIcon: const Icon(Icons.train_outlined),
                    onButtonTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => BookNowScreen(),
                        ),
                      );
                    },
                  ),
                  BottomNavigationButton(
                    buttonText: 'Train Schedule',
                    buttonIcon: const Icon(Icons.calendar_month),
                    onButtonTap: () {},
                  ),
                  BottomNavigationButton(
                    buttonText: 'Manage Bookings',
                    buttonIcon: const Icon(Icons.person_2_outlined),
                    onButtonTap: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.train_outlined), label: 'Book Now'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.calendar_month), label: 'Train Schedule'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.person_2_outlined), label: 'Manage Bookings'),
      //   ],
      //   onTap: (index) {},
      // ),
    );
  }
}
