import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';

final List<SurveyQuestionModel> electronicSurveyQuestions = [
    SurveyQuestionModel(
        question: 'Qual o aparelho eletrônico utilizado?',
        questionType: SurveyQuestionType.option,
        answerOptions: [
          SurveyAnswerModel(id: 1, answer: 'Celular', imagePath: '', value: 0, description: 'Dispositivo móvel'),
          SurveyAnswerModel(id: 1, answer: 'Computador', imagePath: '', value: 1),
          SurveyAnswerModel(id: 1, answer: 'Tablet', imagePath: '', value: 2),
          SurveyAnswerModel(id: 1, answer: 'TV', imagePath: '', value: 3),
        ],
        answerPrefix: '',
        answerSuffix: ''),
    SurveyQuestionModel(
        question: 'Qual a marca do dispositivo?',
        questionType: SurveyQuestionType.anyText,
        answerOptions: [],
        answerPrefix: '',
        answerSuffix: ''),
    SurveyQuestionModel(
        question: 'Qual o modelo do dispositivo?',
        questionType: SurveyQuestionType.anyText,
        answerOptions: [],
        answerPrefix: '',
        answerSuffix: ''),
    SurveyQuestionModel(
        question: 'O equipamento foi utilizado por',
        questionType: SurveyQuestionType.anyNumber,
        answerOptions: [],
        answerPrefix: '',
        answerSuffix: 'minutos'),
    SurveyQuestionModel(
        question: 'Qual foi a fonte de energia utilizada?',
        questionType: SurveyQuestionType.option,
        answerOptions: [
          SurveyAnswerModel(id: 1, answer: 'Eletricidade', imagePath: '', value: 0),
          SurveyAnswerModel(id: 1, answer: 'Energia Solar', imagePath: '', value: 1),
          SurveyAnswerModel(id: 1, answer: 'Bateria', imagePath: '', value: 2),
        ],
        answerPrefix: '',
        answerSuffix: ''),
  ];