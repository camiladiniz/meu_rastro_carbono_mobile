import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';

final List<SurveyQuestionModel> waterSurveyQuestions = [
  SurveyQuestionModel(
      question: 'Quantos banhos você tomou hoje?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      question: 'Utilizou água quente?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: 'Sim', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: 'Não', imagePath: '', value: 2),
      ],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      question: 'Qual foi a duração do banho?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      question: 'Qual o fluxo de água do seu chuveiro?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description: 'A taxa de fluxo de água é a vazão de água que passa pelo chuveiro. Geralmente é medida em litros por minuto (L/min). O limite estabelecido pelo ANEEL é de 8L/min, porém algum chuveiros possuem vazões maiores que este limite.',
      answerSuffix: 'L/min')
];
