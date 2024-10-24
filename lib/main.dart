import 'package:eshop/login.dart';
import 'package:eshop/register.dart';
import 'package:eshop/viewitems.dart';
import 'package:eshop/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home: PageViewer(),
    );
  }
}

// ignore: must_be_immutable
class PageViewer extends StatefulWidget {
  PageViewer({super.key});

  @override
  State<PageViewer> createState() => _PageViewerState();
}

class _PageViewerState extends State<PageViewer> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  void setState(value) {}

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      controller: controller,
      children: [
        WelcomePage(),
        Login(),
        Register(),
        ViewItems(),
      ],
    );
  }
}
