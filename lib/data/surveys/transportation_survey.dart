


// import 'package:flutter/material.dart';
// import 'package:minha_pegada/models/SurveyItem.dart';
// import 'package:minha_pegada/widgets/survey/survey.dart';

// class TransportationSurvey extends StatelessWidget {
//   final PageController controller;

//   const TransportationSurvey({Key? key, required this.controller}): super(key:key);

//   @override
//   Widget build(BuildContext context) {
//     List<SurveyQuestion> questions = [
//         SurveyQuestion("O deslocamento foi realizado por meio de:", QuestionType.TextAndImage, [
//         SurveyQuestionOption("Carro", "assets/images/transportation/car.png"),
//         SurveyQuestionOption("Ônibus", "assets/images/transportation/bus.png"),
//         SurveyQuestionOption("Metrô", "assets/images/transportation/subway.png"),
//         SurveyQuestionOption("Bicicleta", "assets/images/transportation/bike.png"),
//         SurveyQuestionOption("Moto", "assets/images/transportation/motorcycle.png")
//       ], ""),
//       SurveyQuestion("A distância percorrida foi de", QuestionType.Number, [], "Km"),
//       SurveyQuestion("A jornada durou", QuestionType.Number, [], "minutos"),
//       SurveyQuestion("O transporte é movido a", QuestionType.Text, [], "")
//     ];

//     return Scaffold(
//       body: ConsumptionSurvey(
//           surveyName: "locomoção",
//         surveyQuestions: questions,
//       ),
//     );
//   }
// }