import 'package:flutter/material.dart';

class ContainerWaves extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(size.width * 0.6, 0);

    var point1 = Offset(size.width * 0.7, size.height * 0.02);
    var point2 = Offset(size.width * 0.7, size.height * 0.15);

    path.quadraticBezierTo(point1.dx, point1.dy, point2.dx, point2.dy);

    var point3 = Offset(size.width * 0.7, size.height * 0.3);
    var point4 = Offset(size.width * 0.9, size.height * 0.3);

    path.quadraticBezierTo(point3.dx, point3.dy, point4.dx, point4.dy);

    var point5 = Offset(size.width + 10, size.height * 0.3);
    var point6 = Offset(size.width, size.height * 0.5);

    path.quadraticBezierTo(point5.dx, point5.dy, point6.dx, point6.dy);
    path.lineTo(size.width, size.height);

    var point7 = Offset(size.width - 5, size.height - 30);
    var point8 = Offset(size.width - 40, size.height - 30);

    path.quadraticBezierTo(point7.dx, point7.dy, point8.dx, point8.dy);
    path.lineTo(30, size.height - 30);
    // //path.lineTo(30, size.height * 0.8);
    var point9 = Offset(0, size.height * 0.92);
    var point10 = Offset(0, size.height * 0.8);

    path.quadraticBezierTo(point9.dx, point9.dy, point10.dx, point10.dy);
    // path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CurvedContainer extends StatelessWidget {
  const CurvedContainer({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06),
      decoration: const BoxDecoration(color: Colors.white),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.47,
        width: MediaQuery.of(context).size.width,
        child: child,
      ),
    );
  }
}
