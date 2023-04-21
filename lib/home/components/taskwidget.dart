import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/model/home.dart';
import 'package:guzergah/home/view-model/home_view_model.dart';

class TaskWidget extends StatefulWidget {
  HomeViewModel viewModel;
  final height, width;

  TaskWidget(
      {super.key,
      required this.viewModel,
      required this.height,
      required this.width});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  int taskListIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(0),
          border: Border.all(color: Colors.grey, width: 2),
          borderRadius: BorderRadius.circular(15)),
      height: widget.height,
      width: widget.width,
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Text(
                    "Görevler",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                newButton("Ekle"),
                newButton("Başlat"),
                newButton("Durdur"),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  itemCount: taskListIndex,
                  itemBuilder: (BuildContext context, index) {
                    return TaskItem(
                      viewModel: widget.viewModel,
                      index: index,
                      height: widget.height,
                      width: widget.width,
                    );
                  })),
        ],
      ),
    );
  }

  Widget newButton(String txt) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent),
      child: Text(txt),
      onPressed: () {
        setState(() {
          taskListIndex += 1;
          widget.viewModel
              .changeTask(taskListIndex, [statPosition.A, statJob.none]);
        });
      },
    );
  }
}

class TaskItem extends StatefulWidget {
  HomeViewModel viewModel;
  final height, width;
  final index;
  TaskItem(
      {super.key,
      required this.viewModel,
      required this.index,
      required this.height,
      required this.width});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  statJob drowdownJobsValue = statJob.none;
  statPosition drowdownPositionValue = statPosition.A;
  statTask statTaskValue = statTask.finish;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: [
          Expanded(child: Text("data")),
          drowDownPositionWidget(),
          drowDownJobsWidget(),
        ],
      ),
    );
  }

  DropdownButton<dynamic> drowDownPositionWidget() {
    return DropdownButton(
        value: drowdownPositionValue,
        onChanged: (value) {
          setState(() {
            drowdownPositionValue = value;
            widget.viewModel.changeTask(
                widget.index, [drowdownPositionValue, drowdownJobsValue]);
          });
        },
        items: const [
          DropdownMenuItem(value: statPosition.A, child: Text("A")),
          DropdownMenuItem(value: statPosition.B, child: Text("B")),
          DropdownMenuItem(value: statPosition.C, child: Text("C")),
          DropdownMenuItem(value: statPosition.D, child: Text("D")),
        ]);
  }

  DropdownButton<dynamic> drowDownJobsWidget() {
    return DropdownButton(
        value: drowdownJobsValue,
        onChanged: (value) {
          setState(() {
            drowdownJobsValue = value;
            widget.viewModel.changeTask(
                widget.index, [drowdownPositionValue, drowdownJobsValue]);
          });
        },
        items: const [
          DropdownMenuItem(value: statJob.none, child: Text("None")),
          DropdownMenuItem(value: statJob.pickUp, child: Text("pickUp")),
          DropdownMenuItem(value: statJob.pickDown, child: Text("pickDown")),
        ]);
  }
}
