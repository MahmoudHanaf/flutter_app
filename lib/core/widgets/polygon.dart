import 'package:flutter/material.dart';

Widget polygon({required Color color}) => Stack(alignment: Alignment.bottomCenter, children: [
          ClipPath(
          clipper: TriangleClipper(), // Custom clipper for the triangle
          child: Container(
            width: 15, // Adjust the size as needed
            height: 7, // Adjust the size as needed
            color: color, // Triangle color
          ),
        ),
          Container(
            height: 3,
            width: 30,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(20),
                topEnd: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0xFF70B5FF),
                  blurRadius: 17.31,
                  offset: Offset(0, -5.47),
                  spreadRadius: 0,
                )
              ],
            ),
          ),
        ]);

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height); // Start from the bottom-left corner
    path.lineTo(size.width / 2, 0); // Move to the top-center point
    path.lineTo(size.width, size.height); // Move to the bottom-right corner
    path.close(); // Close the path to form a triangle
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // We don't need to recalculate the clip path
  }
}
