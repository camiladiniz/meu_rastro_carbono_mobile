// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SurveyController on _SurveyController, Store {
  late final _$getSurveysByDateAsyncAction =
      AsyncAction('_SurveyController.getSurveysByDate', context: context);

  @override
  Future<SurveyPerDayResponse> getSurveysByDate(DateTime date) {
    return _$getSurveysByDateAsyncAction
        .run(() => super.getSurveysByDate(date));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
