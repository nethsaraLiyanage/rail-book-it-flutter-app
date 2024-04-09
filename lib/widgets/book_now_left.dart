import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railway/providers/language_provider.dart';

import 'package:railway/widgets/enter_date.dart';
import 'package:railway/widgets/enter_station.dart';

class BookNowLeft extends ConsumerWidget {
  const BookNowLeft({
    super.key,
    required this.containerWidth,
    required this.containerHeight,
  });
  final double containerWidth;
  final double containerHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromController = TextEditingController();
    final toController = TextEditingController();
    final departureController = TextEditingController();
    final returnController = TextEditingController();

    final language = ref.watch(languageProvider);

    return SizedBox(
      width: containerWidth * 0.5,
      height: containerHeight,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EnterStation(
                  textController: fromController,
                  title: language == 'Sinhala' ? 'සිට' : 'From',
                ),
                const Icon(
                  Icons.train_rounded,
                  size: 40,
                ),
                EnterStation(
                  textController: toController,
                  title: language == 'Sinhala' ? 'දක්වා' : 'To',
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                EnterDate(
                  textController: departureController,
                  title: language == 'Sinhala'
                      ? 'පිටත්වෙන දිනය'
                      : 'Departure Date',
                ),
                const SizedBox(
                  width: 30,
                ),
                EnterDate(
                  textController: returnController,
                  title: language == 'Sinhala'
                      ? 'ආපසු පැමිණීමේ දිනය'
                      : 'Return Date',
                )
              ],
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    'Class',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
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
                        child: Text(
                          'First Class',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                        ),
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
                        child: Text(
                          'Second Class',
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 250,
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                    ),
                    onPressed: () {},
                    child: Text(
                      'Third Class',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontSize: 15,
                            color: Colors.white,
                          ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Number of Passengers',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.grey),
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
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
                  child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
