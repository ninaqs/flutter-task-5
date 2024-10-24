import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blueGrey.shade200, Colors.white])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Form(
                  key: GlobalKey<FormState>(),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Welcome!',
                          style: TextStyle(
                              color: Colors.blueGrey,
                              fontWeight: FontWeight.bold,
                              fontSize: 32),
                        ),
                        const Text('Have an account? Log in:',
                            style: TextStyle(fontSize: 20)),
                        Container(
                            padding: const EdgeInsets.all(12),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white60,
                                    hintText: 'Username',
                                    border: OutlineInputBorder()))),
                        Container(
                            padding: const EdgeInsets.all(12),
                            child: TextFormField(
                                decoration: const InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white60,
                                    hintText: 'Password',
                                    border: OutlineInputBorder()))),
                        ElevatedButton(
                            onPressed: () {},
                            style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.brown),
                                foregroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            child: const Text('Log in',
                                style: TextStyle(fontSize: 20)))
                      ])),
              const Column(children: [
                Text(
                  "First visit? Swipe To Join Us",
                  style: TextStyle(fontSize: 20),
                ),
                Icon(Icons.arrow_forward_ios)
              ])
            ],
          ),
        ));
  }
}
