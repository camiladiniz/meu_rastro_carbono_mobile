import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meu_rastro_carbono/domain/user/user_entity.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_rastro_carbono/ui/widgets/cards/survey_item_card.dart';

import '../../stores/survey_controller.dart';
import '../../stores/user_controller.dart';
import '../assets/styles/app_theme.dart';
import '../widgets/models/menu_navigate_item_model.dart';

class SurveysPage extends StatefulWidget {
  SurveysPage({super.key});

  @override
  State<SurveysPage> createState() => _SurveysPageState();
}

class _SurveysPageState extends State<SurveysPage> {
  final UserController userController = Modular.get<UserController>();
  final SurveyController surveyController = Modular.get<SurveyController>();

  DateTime filterDate = DateTime.now();

  List<CardItemModel> categories = [
    CardItemModel(
        title: 'Água',
        icon: Icons.water,
        color: Colors.blue,
        surveyName: 'agua',
        status: SurveyStatus.answered),
    CardItemModel(
        title: 'Alimentação',
        icon: Icons.food_bank,
        color: Colors.pink,
        surveyName: 'alimentos',
        status: SurveyStatus.answered),
    CardItemModel(
        title: 'Eletrônicos',
        icon: Icons.electrical_services,
        color: Colors.indigo,
        surveyName: 'dispositivos',
        status: SurveyStatus.answered),
    CardItemModel(
        title: 'Locomoção',
        icon: Icons.directions_train,
        color: Colors.purple,
        surveyName: 'transporte',
        status: SurveyStatus.answered),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    loadSurveyData();
  }

  Future<void> loadSurveyData() async {
    await surveyController.initializeSharedPreferences();
    var surveys = await surveyController.getSurveysByDate(filterDate);

    if (!surveys.waterSurvey) {
      categories[0].status = SurveyStatus.pending;
    } else {
      categories[0].status = SurveyStatus.answered;
    }

    if (!surveys.foodSurvey) {
      categories[1].status = SurveyStatus.pending;
    } else {
      categories[1].status = SurveyStatus.answered;
    }

    if (!surveys.electronicSurvey) {
      categories[2].status = SurveyStatus.pending;
    } else {
      categories[2].status = SurveyStatus.answered;
    }

    if (!surveys.locomotionSurvey) {
      categories[3].status = SurveyStatus.pending;
    } else {
      categories[3].status = SurveyStatus.answered;
    }
    setState(() {
      categories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
        child: Column(children: [
          GestureDetector(
              child: DatetimeWidget(filterDate: filterDate),
              onTap: () async {
                var datePicked = await showDatePicker(
                  helpText: "Select a datetime",
                  context: context,
                  initialDate: filterDate,
                  firstDate: DateTime(1995, 06, 16),
                  lastDate: DateTime.now(),
                );
                if (datePicked != null) {
                  filterDate = datePicked;
                  setState(() {
                    filterDate;
                  });
                  loadSurveyData();
                }
              }),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: Colors.green,
                ),
              ],
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.lightGreen[100],
                  child:
                      Image.asset('lib/ui/assets/images/leaf.png', height: 45),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Observer(
                        builder: (_) => Text(
                          'Olá ${userController.name}, para te ajudar a reduzir sua pegada de carbono, preciso entender sua atual emissão. Vamos lá?',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(103, 103, 101, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          for (var chunk in _chunkedItems(categories, 2))
            Row(
              children: [
                Expanded(
                  child: SurveyItemCard(
                      title: chunk[0].title,
                      icon: chunk[0].icon,
                      color: chunk[0].color,
                      status: chunk[0].status,
                      onTap: () => {
                            Modular.to
                                .pushNamed(
                                    '/survey/${chunk[0].surveyName}?datetime=$filterDate')
                                .then((_) => loadSurveyData())
                          }),
                ),
                Expanded(
                  child: SurveyItemCard(
                      title: chunk[1].title,
                      icon: chunk[1].icon,
                      color: chunk[1].color,
                      status: chunk[1].status,
                      onTap: () => {
                            Modular.to
                                .pushNamed(
                                    '/survey/${chunk[1].surveyName}?datetime=$filterDate')
                                .then((_) => loadSurveyData())
                          }),
                ),
              ],
            ),
        ]),
      ),
    );
  }
}

class DatetimeWidget extends StatelessWidget {
  const DatetimeWidget({
    super.key,
    required this.filterDate,
  });

  final DateTime filterDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        "Clique para alterar a data: ${filterDate.toLocal().day}/${filterDate.toLocal().month}/${filterDate.toLocal().year}",
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}

List<List<T>> _chunkedItems<T>(List<T> list, int chunkSize) {
  return List.generate(
    (list.length / chunkSize).ceil(),
    (i) => list.sublist(i * chunkSize, (i + 1) * chunkSize),
  );
}
