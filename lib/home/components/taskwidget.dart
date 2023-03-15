import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/model/home.dart';
import 'package:guzergah/home/view-model/home_view_model.dart';

class TaskWidget extends StatefulWidget {
  HomeViewModel viewModel;

  TaskWidget({super.key, required this.viewModel});

  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  int taskListIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xC9D7E0),
      child: Column(
        children: [
          Card(
            child: Row(
              children: [
                Text("Görev"),
                Spacer(),
                ElevatedButton(
                  child: Text("Görev Ekle"),
                  onPressed: () {
                    setState(() {
                      taskListIndex += 1;
                      widget.viewModel.changeTask(
                          taskListIndex, [statPosition.A, statJob.none]);
                    });
                  },
                ),
                Spacer(),
                ElevatedButton(
                    onPressed: () {}, child: Text("Görevleri Başlat")),
                Spacer(),
                ElevatedButton(onPressed: () {}, child: Text("Durdur")),
                Spacer()
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
                    );
                  })),
        ],
      ),
    );
  }
}

class TaskItem extends StatefulWidget {
  HomeViewModel viewModel;
  final index;
  TaskItem({super.key, required this.viewModel, @required this.index});

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
        leading: Text(widget.index.toString()),
        title: Row(
          children: [
            Expanded(child: drowDownPositionWidget()),
            Expanded(child: drowDownJobsWidget()),
          ],
        ),
        trailing: Icon(
          Icons.circle,
          color: Colors.grey,
        ));
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
          DropdownMenuItem(value: statPosition.E, child: Text("E")),
          DropdownMenuItem(value: statPosition.F, child: Text("F")),
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
