import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:railway/providers/language_provider.dart';
import 'package:railway/screens/landing_screen.dart';

class RegisterScreen extends ConsumerWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final emailController = TextEditingController();
    final pwController = TextEditingController();

    final language = ref.watch(languageProvider);

    void onRegister() {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (ctx) => LandingScreen(),
          ),
          (route) => false);
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              'assets/images/sign.jpg',
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: width,
            height: height,
            color: const Color.fromARGB(180, 22, 142, 84),
          ),
          SizedBox(
            width: width,
            height: height,
            child: Column(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.6,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            language == 'Sinhala'
                                ? 'පටන් ගනිමු'
                                : 'Let\'s Get Started',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                language == 'Sinhala'
                                    ? 'ඊමේල් එකක් ඇතුලත් කරන්න'
                                    : 'Enter a Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                height: height * 0.051,
                                width: width * 0.19,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white),
                                child: TextField(
                                  controller: emailController,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                language == 'Sinhala'
                                    ? 'මුරපදයක් ඇතුලත් කරන්න'
                                    : 'Enter a Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                height: height * 0.051,
                                width: width * 0.19,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white),
                                child: TextField(
                                  controller: pwController,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.06,
                            width: width * 0.17,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 76, 228, 81)),
                              onPressed: onRegister,
                              child: Text(language == 'Sinhala'
                                  ? 'ලියාපදිංචි කරන්න'
                                  : 'Register'),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
