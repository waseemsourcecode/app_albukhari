import 'package:app_albukhari/features/domain/models/model_albukhari.dart';
import 'package:flutter/material.dart';
import 'package:flip_widget/flip_widget.dart';
import 'dart:math' as math;

class BookView extends StatefulWidget {
  final List<Hadith> hadits;

  const BookView({super.key, required this.hadits});
  @override
  _MyAppState createState() => _MyAppState();
}

const double _MinNumber = 0.008;
double _clampMin(double v) {
  if (v < _MinNumber && v > -_MinNumber) {
    if (v >= 0) {
      v = _MinNumber;
    } else {
      v = -_MinNumber;
    }
  }
  return v;
}

class _MyAppState extends State<BookView> {
  GlobalKey<FlipWidgetState> _flipKey = GlobalKey();

  Offset _oldPosition = Offset.zero;
  bool _visible = true;
  int pgno = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = const Size(256, 256);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Visibility(
              visible: _visible,
              child: Expanded(
                child: GestureDetector(
                  child: FlipWidget(
                    key: _flipKey,
                    textureSize: size * 2,
                    child: Container(
                      color: Colors.blue,
                      child: Text(widget.hadits[pgno].text ?? "ERROR"),
                    ),
                    // leftToRight: true,
                  ),
                  onHorizontalDragStart: (details) {
                    _oldPosition = details.globalPosition;
                    _flipKey.currentState?.startFlip();
                    if (pgno == widget.hadits.length) {
                      setState(() {
                        pgno = 0;
                      });
                    } else {
                      setState(() {
                        pgno += 1;
                      });
                    }
                  },
                  onHorizontalDragUpdate: (details) {
                    Offset off = details.globalPosition - _oldPosition;
                    double tilt = 1 / _clampMin((-off.dy + 20) / 100);
                    double percent = math.max(0, -off.dx / size.width * 1.4);
                    percent = percent - percent / 2 * (1 - 1 / tilt);
                    _flipKey.currentState?.flip(percent, tilt);
                  },
                  onHorizontalDragEnd: (details) {
                    _flipKey.currentState?.stopFlip();
                  },
                  onHorizontalDragCancel: () {
                    _flipKey.currentState?.stopFlip();
                  },
                ),
              ),
            ),
            // TextButton(
            //     onPressed: () {
            //       setState(() {
            //         _visible = !_visible;
            //       });
            //     },
            //     child: Text("Toggle"))
          ],
        ),
      ),
    );
  }
}
