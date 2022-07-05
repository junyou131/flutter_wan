import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/common/res/z_res.dart';

typedef WaterCallback = void Function(String id);

class WaterLocation {
  final double x;
  double y;
  final double space; // most movie distance
  final double initY; // init y
  bool direction; // true or false// -or+
  final int spaceCount;

  WaterLocation(
      {required this.x,
      required this.y,
      required this.space,
      required this.initY,
      required this.spaceCount,
      this.direction = true});
}

class AtosWaterView extends StatefulWidget {
  final int ballCount;

  final double width;
  final double height;
  final double viewWidthR;
  final double viewHeightR;
  final int speed;
  final WaterCallback callback;

  const AtosWaterView(
      {required this.width,
      required this.height,
      this.viewWidthR = 24,
      this.viewHeightR = 24,
      this.ballCount = 11,
      this.speed = 15,
      required this.callback,
      Key? key})
      : super(key: key);

  @override
  State<AtosWaterView> createState() => _AtosWaterViewState();
}

class _AtosWaterViewState extends State<AtosWaterView> {
  late var listLocations = <WaterLocation>[];
  late Timer _timer;

  @override
  initState() {
    initWaterLocations();
    _timer = Timer.periodic(Duration(milliseconds: widget.speed), (timer) {
      for (var element in listLocations) {
        if (element.y > (element.initY + element.space)) {
          element.direction = true;
        } else if (element.y < (element.initY - element.space)) {
          element.direction = false;
        }
        if (element.direction) {
          element.y -= element.space / element.spaceCount;
        } else {
          element.y += element.space / element.spaceCount;
        }
      }
      setState(() {
        // for (var element in listLocations) {
        //   printLog('x:${element.x}  y:${element.y}');
        // }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:[BoxShadow(color: Colors.transparent,blurRadius: 3.0.r),],
          border: Border.all(color: Colors.purple.shade200),
        ),
        height: widget.height,
        width: widget.width,
        child: Stack(
          children: listLocations
              .map(
                (e) => Positioned(
                  top: e.y,
                  left: e.x,
                  child: GestureDetector(
                    onTap: () => widget.callback.call(e.initY.toString()),
                    child: CircleAvatar(
                        radius: widget.viewWidthR,
                        child: Center(
                          child: Text('y:${e.y.toStringAsFixed(2)} \n ${e.direction}',
                              textAlign:TextAlign.center,
                              style: TextStyle(
                                color: ColorRes.white,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                              )),
                        )),
                  ),
                ),
              )
              .toList(),
        ));
  }

  void initWaterLocations() {
    var random = Random();
    double spaceWidth =
        (widget.width - widget.viewWidthR * 2) / widget.ballCount;
    double spaceHeight =
        (widget.height - widget.viewHeightR * 2) / widget.ballCount;
    var listX = <double>[];
    var listY = <double>[];
    for (int i = 0; i < widget.ballCount; i++) {
      listX.add(i * spaceWidth + widget.viewWidthR / 2);
      listY.add(i * spaceHeight + widget.viewHeightR / 2);
    }
    for (int i1 = 0; i1 < widget.ballCount; i1++) {
      var indexX = listX.length == 1 ? 0 : random.nextInt(listX.length);
      var indexY = listY.length == 1 ? 0 : random.nextInt(listY.length);
      listLocations.add(WaterLocation(
          x: listX[indexX],
          y: listY[indexY],
          space: widget.viewHeightR / 2 - random.nextDouble() * 10,
          initY: listY[indexY],
          spaceCount: random.nextInt(50) + 40,
          direction: random.nextInt(10) % 2 == 0));
      listX.removeAt(indexX);
      listY.removeAt(indexY);
    }
    // for (var element in listLocations) {
    //   printLog(
    //       'initY:${element.initY} x : ${element.x},y : ${element.y} space : ${element.space} direction : ${element.direction}');
    // }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
