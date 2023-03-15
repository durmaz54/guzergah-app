// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$tasksListIndexAtom =
      Atom(name: '_HomeViewModelBase.tasksListIndex', context: context);

  @override
  int get tasksListIndex {
    _$tasksListIndexAtom.reportRead();
    return super.tasksListIndex;
  }

  @override
  set tasksListIndex(int value) {
    _$tasksListIndexAtom.reportWrite(value, super.tasksListIndex, () {
      super.tasksListIndex = value;
    });
  }

  late final _$tasksAtom =
      Atom(name: '_HomeViewModelBase.tasks', context: context);

  @override
  List<List<dynamic>> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(List<List<dynamic>> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$realTimeImageAtom =
      Atom(name: '_HomeViewModelBase.realTimeImage', context: context);

  @override
  String get realTimeImage {
    _$realTimeImageAtom.reportRead();
    return super.realTimeImage;
  }

  @override
  set realTimeImage(String value) {
    _$realTimeImageAtom.reportWrite(value, super.realTimeImage, () {
      super.realTimeImage = value;
    });
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void changeTask(int index, List<dynamic> arr) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeTask');
    try {
      return super.changeTask(index, arr);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasksListIndex: ${tasksListIndex},
tasks: ${tasks},
realTimeImage: ${realTimeImage}
    ''';
  }
}
