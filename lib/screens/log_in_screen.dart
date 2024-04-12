import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:railway/providers/language_provider.dart';

import 'package:railway/screens/landing_screen.dart';
import 'package:railway/screens/register_screen.dart';

class LogInScreen extends ConsumerWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final emailController = TextEditingController();
    final pwController = TextEditingController();

    final language = ref.watch(languageProvider);

    void onLogIn() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LandingScreen()),
        (route) => false,
      );
    }

    void onRegister() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => RegisterScreen(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: width,
            height: height,
            child: Image.asset(
              'assets/images/login.jpg',
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
                            language == 'Sinhala' ? 'ඇතුල් වන්න' : 'Log In',
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
                                    ? 'විද්යුත් තැපෑල'
                                    : 'Email',
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
                                language == 'Sinhala' ? 'මුරපදය' : 'Password',
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
                              onPressed: onLogIn,
                              child: Text(
                                language == 'Sinhala' ? 'ඇතුල් වන්න' : 'Log In',
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                language == 'Sinhala'
                                    ? 'ගිණුමක් නැද්ද?'
                                    : 'Don\'t have an account?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                              ),
                              TextButton(
                                onPressed: onRegister,
                                child: Text(
                                  language == 'Sinhala'
                                      ? 'ලියාපදිංචි කරන්න'
                                      : 'Register',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            ],
                          )
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
