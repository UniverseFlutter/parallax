import 'package:flutter/material.dart';
import 'package:parallax/parallax_page_view.dart';
import 'package:parallax/top_bar.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late PageController _controller;
  double offset = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.6);
    _controller.addListener(() {
      setState(() {
        offset = _controller.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TopBar(),
        ParallaxPageView(
          controller: _controller,
          offset: offset,
        ),
      ],
    );
  }
}
