import 'package:flutter/material.dart';

import 'package:railway/screens/landing_screen.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final emailController = TextEditingController();
    final pwController = TextEditingController();

    void onLogIn() {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => LandingScreen()),
        (route) => false,
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
                            'Log In',
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
                                'Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 20, color: Colors.white),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                height: 40,
                                width: 280,
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
                                'Password',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        fontSize: 20, color: Colors.white),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                height: 40,
                                width: 280,
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
                            height: 50,
                            width: 260,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 76, 228, 81)),
                              onPressed: onLogIn,
                              child: const Text('Log In'),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                'Don\'t have an account?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Register',
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
