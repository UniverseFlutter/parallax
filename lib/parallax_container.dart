import 'package:flutter/material.dart';

class ParallaxContainer extends StatefulWidget {
  final String index;
  final double offset;
  final double i;
  final String text;

  const ParallaxContainer(
      {Key? key,
      required this.index,
      required this.offset,
      required this.i,
      required this.text})
      : super(key: key);

  @override
  _ParallaxContainerState createState() => _ParallaxContainerState();
}

class _ParallaxContainerState extends State<ParallaxContainer> {
  double bottomPad = 40.0;
  double topPad = 0.0;
  double horiPad = 25.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (value) {
        setState(() {
          bottomPad = 50.0;
          topPad = 10.0;
          horiPad = 35.0;
        });
      },
      onTapUp: (value) {
        setState(() {
          bottomPad = 40.0;
          topPad = 0.0;
          horiPad = 25.0;
        });
      },
      child: AnimatedPadding(
        duration: Duration(milliseconds: 150),
        padding: EdgeInsets.only(
          left: horiPad,
          right: horiPad,
          bottom: bottomPad,
          top: topPad,
        ),
        child: Stack(
          children: [
            Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0x00000000),
                              Color(0x00000000),
                              Color(0xff000000),
                            ],
                          ),
                        ),
                        child: Image.asset(
                          'assets/${widget.index}.jpg',
                          fit: BoxFit.fitWidth,
                          alignment: Alignment(
                            0.0,
                            -((widget.offset.abs() + 0.4) - widget.i),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 35.0,
                          child: FloatingActionButton(
                            child: Text(
                              '+',
                              style: TextStyle(
                                fontSize: 28.0,
                              ),
                            ),
                            mini: true,
                            onPressed: () {},
                            splashColor: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        padding: EdgeInsets.only(left: 35.0),
                        height: 110.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.text,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Ексклюзив на Playstation',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                'PS4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'SlimPlay',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            (widget.index == '0')
                ? OverflowBox(
                    minWidth: 0.0,
                    maxWidth: 200.0,
                    minHeight: 0.0,
                    maxHeight: 100.0,
                    alignment: Alignment(0.0, -1.45),
                    child: Column(
                      children: [
                        Text(
                          'КЛАСНІ ІГРИ',
                          style: TextStyle(fontSize: 16.0, color: Colors.blue),
                        ),
                        Text(
                          'Вже скоро',
                          style: TextStyle(
                            fontSize: 25.0,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
