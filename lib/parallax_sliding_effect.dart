import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';

class ParallaxSlidingEffect extends StatefulWidget {
  const ParallaxSlidingEffect({
    Key? key,
    required this.image, this.height=100, this.width=100,
  }) : super(key: key);
  final ImageProvider image;
  final double height;
  final double width;

  @override
  State<ParallaxSlidingEffect> createState() => _ParallaxSlidingEffectState();
}

class _ParallaxSlidingEffectState extends State<ParallaxSlidingEffect> {
  double initX = 0.0, initY = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          StreamBuilder<GyroscopeEvent>(
              stream: SensorsPlatform.instance.gyroscopeEvents,
              builder: (BuildContext context, AsyncSnapshot<GyroscopeEvent> snapshot) {

                if (snapshot.hasData) {
                  initX = initX + (snapshot.data!.y) * 5;
                  initY = initY + (snapshot.data!.x) * 5;
                }
                return Positioned(
                  left: 10 - initX,
                  right: 10 + initX,
                  top: 10 - initY,
                  bottom: 10 + initY,
                  child: Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Container(
                            width: widget.height,
                            height: widget.width,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  isAntiAlias: true,
                                  opacity: 0.8,
                                  image: widget.image,
                                  colorFilter: ColorFilter.mode(
                                      Colors.white.withOpacity(.1),
                                      BlendMode.srcOver),
                                  fit: BoxFit.cover),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white.withOpacity(0.0)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Positioned(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
            child: Center(
              child: Container(
                width: 250,
                height: 350,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: .1),
                  image:
                  DecorationImage(image: widget.image, fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}