import 'dart:math';
import 'package:flutter/material.dart';

Widget LevelsWidget(
    String image, String number, String title, Color color, bool isAvailable) {
  return Container(
    margin: const EdgeInsets.all(2),
    child: Column(children: [
      Stack(
        alignment: Alignment.bottomRight,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Transform.rotate(
                angle: 3 * pi / 4,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation(Colors.yellow[600]),
                  value: Random().nextDouble(),
                  strokeWidth: 60,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircleAvatar(backgroundColor: Colors.white, radius: 42),
              ),
              CircleAvatar(
                radius: 35,
                backgroundColor: isAvailable ? color : Colors.grey[300],
                child: Image.asset(image, height: 50),
              )
            ],
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset('lib/ui/assets/images/leaf_no_face.png', height: 28),
              Text(
                number,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
      const SizedBox(height: 5),
      Center(
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
      )
    ]),
  );
}
