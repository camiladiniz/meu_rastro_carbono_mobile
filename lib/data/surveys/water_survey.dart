import '../../ui/widgets/models/surveys/survey_answer_model.dart';
import '../../ui/widgets/models/surveys/survey_question_model.dart';
import '../datasets/water_carbon_emission_dataset.dart';

final List<SurveyQuestionModel> waterSurveyQuestions = [
  SurveyQuestionModel(
    identification: 'showersAmount',
      question: 'Quantos banhos você tomou hoje?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'hotWater',
      question: 'Utilizou água quente?',
      questionType: SurveyQuestionType.option,
      answerOptions: [
        SurveyAnswerModel(id: 1, answer: 'Sim', imagePath: '', value: 1),
        SurveyAnswerModel(id: 2, answer: 'Não', imagePath: '', value: 2),
      ],
      answerPrefix: '',
      answerSuffix: ''),
  SurveyQuestionModel(
      identification: 'showerDuration',
      question: 'Qual foi a duração aproximada de cada banho?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      description: '',
      answerSuffix: 'minutos'),
  SurveyQuestionModel(
      identification: 'showerWaterFlow',
      question: 'Qual o fluxo de água do seu chuveiro?',
      questionType: SurveyQuestionType.anyNumber,
      answerOptions: [],
      answerPrefix: '',
      userAnswer: '8', // default
      description: 'A taxa de fluxo de água é a vazão de água que passa pelo chuveiro. Geralmente é medida em litros por minuto (L/min). O limite estabelecido pelo ANEEL é de 8L/min, porém algum chuveiros possuem vazões maiores que este limite.',
      answerSuffix: 'L/min')
];

  String waterFootprintCalculation(List<SurveyQuestionModel> survey) {
    String quantidadeDeBanhosAnswered = survey.firstWhere((s) => s.identification == 'showersAmount').userAnswer ?? '0';
    bool usaAguaQuente = survey.firstWhere((s) => s.identification == 'hotWater').userAnswer == 'Sim' ? true : false;
    String duracaoBanhoMinutosAnswered = survey.firstWhere((s) => s.identification == 'showerDuration').userAnswer ?? '0';
    String taxaFluxoAguaAnswered = survey.firstWhere((s) => s.identification == 'showerWaterFlow').userAnswer ?? '0';

    double duracaoDoBanhoEmMinutos = double.parse(duracaoBanhoMinutosAnswered);
    double taxaFluxoAguaLitrosPorMin = double.parse(taxaFluxoAguaAnswered);
    double quantidadeDeBanhos = double.parse(quantidadeDeBanhosAnswered);

    double diferencialDeTemperatura = 0;
    if (usaAguaQuente) {
      diferencialDeTemperatura = temperaturaAguaAposAquecimentoDefault - temperaturaAguaNaturalDefault;
    }

    // convertendo Kg CO2 para MJ: fatoremissao * (1 kWh/3.6 MJ);
    double fatorEnergiaEmMJ = 4.18;
    double fatorEmissaoCarbono = fatorEmissaoCarbonoNaGeracaoEletricidadeBrasilKgCO2PorkWh * (1 /3.6);

    double emissaodiariaCO2emKg = (quantidadeDeBanhos * duracaoDoBanhoEmMinutos * taxaFluxoAguaLitrosPorMin * fatorEnergiaEmMJ * fatorEmissaoCarbono * diferencialDeTemperatura) / (1000); //100 liters per cubic meter
    // Where: 
    // - quantidadeDeBanhos - quantidade de banho total tomados no dia
    // - duracaoDoBanhoEmMinutos - duração aproximada de cada um dos banhos tomados no dia
    // - taxaFluxoAguaLitrosPorMin - quantidade de agua usada por minuto
    // - fatorEnergia - é a energia necessária para aquecer 1 metro cúbico de água em 1 grau Celsius (4.18 MJ/m³°C). 
    // - fatorEmissaoCarbono - depende da fonte de energia utilizada para o aquecimento da água (eletricidade, gás natural, etc.) e é expressa em kg CO2 por MJ. (método padrão selecionado foi eletricidade)
    // - diferencialDeTemperatura - diferença entre a temparatura da água gelada e a temperatura alcançada após o aquecimento do chuveiro em graus Celsius. Padrão de 30 graus foi aplicado

    return 'A pegada de carbono diária do uso de água no seu banho é de $emissaodiariaCO2emKg kg CO2e';
  }