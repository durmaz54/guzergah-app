import 'package:mobx/mobx.dart';
part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

enum statJob {
  none,
  pickUp,
  pickDown,
}

enum statTask { none, start, finish }

enum statPosition { A, B, C, D, E, F }

abstract class _HomeViewModelBase with Store {
  @observable
  int tasksListIndex = 1;

  @observable
  List<List> tasks = [
    [statPosition.A, statJob.none]
  ];

  @observable
  String realTimeImage =
      "https://fastly.picsum.photos/id/925/1280/720.jpg?hmac=Zmf0R_4BNaUCwJ1xZwBSHd8Y16ifb6qoz3perLnKC88";

  @action
  void changeImage(String image) {
    this.realTimeImage = image;
    print(image);
  }

  @action
  void changeTask(int index, List arr) {
    try {
      tasks[index] = arr;
    } catch (e) {
      tasks.add(arr);
    }
    print(tasks);
  }
}
