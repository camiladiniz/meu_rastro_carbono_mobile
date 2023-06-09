import 'dart:math';
import 'package:flutter/material.dart';

Widget LevelsWidget(
    String image, String number, String title, Color color, bool isAvailable, double pontuationPercentage, bool hideText) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: 3 * pi / 4,
                  child: CircularProgressIndicator(
                    backgroundColor:Colors.grey[300],
                    valueColor: isAvailable
                        ? AlwaysStoppedAnimation(Colors.yellow[600])
                        : AlwaysStoppedAnimation(Colors.grey[300]),
                    value: pontuationPercentage,
                    strokeWidth: 60,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      CircleAvatar(backgroundColor: Colors.white, radius: 42),
                ),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: isAvailable ? color : Colors.grey[300],
                  child: Image.asset(image, height: 50),
                )
              ],
            ),
            Visibility(
              visible: isAvailable,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('lib/ui/assets/images/leaf_no_face.png',
                      height: 28),
                  Text(
                    number,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ],
        ),
        Visibility(
          visible: isAvailable && !hideText,
          child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
        ),),
        
      ]);
}
