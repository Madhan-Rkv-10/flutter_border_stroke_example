import 'package:flutter/material.dart';

/// Flutter code sample for [BorderSide.strokeAlign].

void main() => runApp(const StrokeAlignApp());

class StrokeAlignApp extends StatelessWidget {
  const StrokeAlignApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StrokeAlignExample(),
    );
  }
}

class StrokeAlignExample extends StatefulWidget {
  const StrokeAlignExample({super.key});

  @override
  State<StrokeAlignExample> createState() => _StrokeAlignExampleState();
}

class _StrokeAlignExampleState extends State<StrokeAlignExample>
    with TickerProviderStateMixin {
  late final AnimationController animation;

  @override
  void initState() {
    super.initState();
    animation = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animation.repeat(reverse: true);
    animation.addListener(_markDirty);
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  void _markDirty() {
    setState(() {});
  }

  static const double borderWidth = 10;
  static const double cornerRadius = 10;
  static const Color borderColor = Color(0x8000b4fc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("BorderSide Stroke Examples")),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Text(
                "StadiumBorder",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              BorderedBox(
                shape: StadiumBorder(
                  side: BorderSide(
                    color: borderColor,
                    width: borderWidth,
                    strokeAlign: (animation.value * 2) - 1,
                  ),
                ),
              ),

              const Divider(),
              const Text(
                "CircleBorder & OvalBorder",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      const Text("CircleBorder"),
                      BorderedBox(
                        shape: CircleBorder(
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("OvalBorder"),
                      BorderedBox(
                        shape: OvalBorder(
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(),
              const Text(
                "BeveledRectangleBorder",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      const Text("Default Bevel"),
                      BorderedBox(
                        shape: BeveledRectangleBorder(
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Rounded Bevel"),
                      BorderedBox(
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(cornerRadius),
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(),
              const Text(
                "RoundedRectangleBorder",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      const Text("Default Rectangle"),
                      BorderedBox(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Rounded Rectangle"),
                      BorderedBox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(cornerRadius),
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(),
              const Text(
                "StarBorder Variations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: [
                      const Text("Standard Star"),
                      BorderedBox(
                        shape: StarBorder(
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("8-Point Star"),
                      BorderedBox(
                        shape: StarBorder(
                          pointRounding: 1,
                          innerRadiusRatio: 0.5,
                          points: 8,
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("6-Side Polygon"),
                      BorderedBox(
                        shape: StarBorder.polygon(
                          sides: 6,
                          pointRounding: 0.5,
                          side: BorderSide(
                            color: borderColor,
                            width: borderWidth,
                            strokeAlign: (animation.value * 2) - 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BorderedBox extends StatelessWidget {
  const BorderedBox({super.key, required this.shape});

  final ShapeBorder shape;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 50,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: ShapeDecoration(
          color: const Color(0xff012677),
          shape: shape,
        ),
      ),
    );
  }
}
