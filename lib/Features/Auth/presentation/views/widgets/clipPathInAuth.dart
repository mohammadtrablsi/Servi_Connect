import 'package:flutter/material.dart';
import 'package:servi_connect/constants.dart';
import 'package:sizer/sizer.dart';

class ClipPathInAuth extends StatelessWidget {
  const ClipPathInAuth({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            Stack(
              children: [
                Stack(
                  children: [
                    ClipPath(
                      clipper: ThirdWaveClipper(),
                      child: Container(
                        height: 20.h,
                        color: kPrimaryColor.withOpacity(0.7),
                      ),
                    ),
                    ClipPath(
                      clipper: SecondWaveClipper(),
                      child: Container(
                        height: 20.h,
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                    ),
                    ClipPath(
                      clipper: FirstWaveClipper(),
                      child: Container(
                        height: 20.h,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            widget,
          ],
        ),
      ),
    );
  }
}

class FirstWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 35);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 70);
    var secondEndPoint = Offset(size.width, size.height - 35);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height - 60);
    var firstEndPoint = Offset(size.width / 2, size.height - 30);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height + 30);
    var secondEndPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ThirdWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height - 15);
    var firstEndPoint = Offset(size.width / 2, size.height - 11);
    var secondControlPoint = Offset(size.width * 3 / 4, size.height - 15);
    var secondEndPoint = Offset(size.width, size.height - 70);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
