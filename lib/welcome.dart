import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/img"), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Card(
              color: const Color.fromARGB(186, 255, 255, 255),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05,
                    vertical: MediaQuery.of(context).size.height * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Welcome to ECom!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 48, color: Colors.brown)),
                    const Text(
                      'Enjoy shopping easily and find latest designs with best quality.',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height * 0.05)),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Swipe to login',
                            style: TextStyle(fontSize: 18)),
                        Icon(Icons.arrow_forward_ios),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
