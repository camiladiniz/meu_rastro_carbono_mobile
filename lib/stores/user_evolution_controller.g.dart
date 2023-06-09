// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_evolution_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserEvolutionController on _UserEvolutionController, Store {
  late final _$metricsAtom =
      Atom(name: '_UserEvolutionController.metrics', context: context);

  @override
  List<UserMetricsModel> get metrics {
    _$metricsAtom.reportRead();
    return super.metrics;
  }

  @override
  set metrics(List<UserMetricsModel> value) {
    _$metricsAtom.reportWrite(value, super.metrics, () {
      super.metrics = value;
    });
  }

  late final _$treesAmountAtom =
      Atom(name: '_UserEvolutionController.treesAmount', context: context);

  @override
  String get treesAmount {
    _$treesAmountAtom.reportRead();
    return super.treesAmount;
  }

  @override
  set treesAmount(String value) {
    _$treesAmountAtom.reportWrite(value, super.treesAmount, () {
      super.treesAmount = value;
    });
  }

  late final _$tipsAtom =
      Atom(name: '_UserEvolutionController.tips', context: context);

  @override
  List<Tip> get tips {
    _$tipsAtom.reportRead();
    return super.tips;
  }

  @override
  set tips(List<Tip> value) {
    _$tipsAtom.reportWrite(value, super.tips, () {
      super.tips = value;
    });
  }

  late final _$getUserElovutionPointsAsyncAction = AsyncAction(
      '_UserEvolutionController.getUserElovutionPoints',
      context: context);

  @override
  Future<int> getUserElovutionPoints() {
    return _$getUserElovutionPointsAsyncAction
        .run(() => super.getUserElovutionPoints());
  }

  late final _$getUserTipsAsyncAction =
      AsyncAction('_UserEvolutionController.getUserTips', context: context);

  @override
  Future<dynamic> getUserTips() {
    return _$getUserTipsAsyncAction.run(() => super.getUserTips());
  }

  late final _$getUserMetricsAsyncAction =
      AsyncAction('_UserEvolutionController.getUserMetrics', context: context);

  @override
  Future<dynamic> getUserMetrics() {
    return _$getUserMetricsAsyncAction.run(() => super.getUserMetrics());
  }

  @override
  String toString() {
    return '''
metrics: ${metrics},
treesAmount: ${treesAmount},
tips: ${tips}
    ''';
  }
}
