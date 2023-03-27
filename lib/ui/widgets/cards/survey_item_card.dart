import 'package:flutter/material.dart';
import '../models/menu_navigate_item_model.dart';

class SurveyItemCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final SurveyStatus status;

  const SurveyItemCard(
      {super.key,
      required this.title,
      required this.icon,
      required this.color,
      required this.status});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {print('clicou')},
      borderRadius: BorderRadius.circular(16.0),
      splashColor: Colors.white.withOpacity(0.5),
      highlightColor: Colors.transparent,
      child: Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 5.0),
              Icon(
                icon,
                size: 70.0,
                color: Colors.white,
              ),
              const SizedBox(height: 5.0),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    status == SurveyStatus.answered
                        ? Icons.check_circle
                        : Icons.pending,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                      status == SurveyStatus.answered
                          ? 'respondido'
                          : 'pendente',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ))
                ],
              ),
              const SizedBox(height: 8.0),
            ],
          )),
    );
  }
}
