import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:railway/providers/language_provider.dart';
import 'package:railway/providers/log_in_provider.dart';
import 'package:railway/screens/book_now_screen.dart';
import 'package:railway/screens/log_in_screen.dart';
import 'package:railway/screens/search_trains_schedule_screen.dart';
import 'package:railway/widgets/app_bar_title.dart';
import 'package:railway/widgets/bottom_navigation_button.dart';

class LandingScreen extends ConsumerStatefulWidget {
  const LandingScreen({super.key});

  @override
  ConsumerState<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends ConsumerState<LandingScreen> {
  String dropDownValue = 'English';

  void _onBookNow(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const BookNowScreen(),
      ),
    );
  }

  void onTrainSchedule(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const SearchTrainScheduleScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var appBarHeight = height * 0.25;

    final dynamicLogText = ref.watch(logTextProvider);
    final language = ref.watch(languageProvider);

    void onLogIn() {
      if (dynamicLogText == 'Log In') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) => LogInScreen(),
          ),
        );
        ref.read(logTextProvider.notifier).toggleLogText();
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              width: width,
              height: appBarHeight,
              color: const Color.fromARGB(240, 199, 198, 198),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AppBarTitle(),
                  SizedBox(
                    width: 400,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: TextButton(
                            onPressed: onLogIn,
                            child: Text(
                              dynamicLogText,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                            ),
                          ),
                        ),
                        Container(
                          width: 150,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green,
                          ),
                          child: DropdownButton<String>(
                              value: dropDownValue,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              style: const TextStyle(color: Colors.white),
                              underline: Container(height: 0),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropDownValue = newValue!;
                                });
                                ref
                                    .read(languageProvider.notifier)
                                    .toggleLanguage(dropDownValue);
                              },
                              items: const [
                                DropdownMenuItem(
                                  value: 'English',
                                  child: Text('English'),
                                ),
                                DropdownMenuItem(
                                  value: 'Sinhala',
                                  child: Text('Sinhala'),
                                )
                              ]),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.person_2_outlined))
                      ],
                    ),
                  )
                ],
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
                              language == 'Sinhala'
                                  ? 'දුම්රියෙන් ශ්‍රී ලංකාව ගවේෂණය කරන්න'
                                  : 'Explore Sri Lanka By Train',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: language == 'Sinhala' ? 25 : 32,
                                  ),
                            ),
                            Text(
                              language == 'Sinhala'
                                  ? 'ඔබගේ ප්‍රවේශපත්‍ර දැන්ම වෙන්කරවා ගන්න'
                                  : 'Book Your Tickets Now',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: language == 'Sinhala' ? 25 : 32,
                                  ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          language == 'Sinhala'
                              ? 'රේල් බුකිට් ස්වයං-කියෝස්ක්'
                              : 'Rail Bookit Self-Kiosk',
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: language == 'Sinhala' ? 25 : 32,
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
                    buttonText: language == 'Sinhala' ? 'මුල් පිටුව' : 'Home',
                    buttonIcon: const Icon(Icons.home),
                    onButtonTap: () {},
                  ),
                  BottomNavigationButton(
                    buttonText:
                        language == 'Sinhala' ? 'දැන්ම වෙන්කරගන්න' : 'Book Now',
                    buttonIcon: const Icon(Icons.train_outlined),
                    onButtonTap: () {
                      _onBookNow(context);
                    },
                  ),
                  BottomNavigationButton(
                    buttonText: language == 'Sinhala'
                        ? 'දුම්රිය කාලසටහන'
                        : 'Train Schedule',
                    buttonIcon: const Icon(Icons.calendar_month),
                    onButtonTap: () {
                      onTrainSchedule(context);
                    },
                  ),
                  BottomNavigationButton(
                    buttonText: language == 'Sinhala'
                        ? 'වෙන් කිරීම් කළමනාකරණය'
                        : 'Manage Bookings',
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
