import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:guzergah/home/model/home.dart';
import 'package:guzergah/home/view-model/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guzergah/home/services/client.dart';

class HomeView extends StatelessWidget {
  HomeViewModel _viewModel = HomeViewModel();
  final a = [0, 0];
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: RealTimeMap(),
                ),
                Expanded(
                  flex: 1,
                  child: SensorView(),
                )
              ],
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  Expanded(
                      flex: 2,
                      child: TaskWidget(
                        viewModel: _viewModel,
                      )),
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: Colors.black87,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextField(
                              cursorColor: Colors.green,
                              style: TextStyle(color: Colors.green),
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'komut',
                                suffixIcon: IconButton(
                                  onPressed: _controller.clear,
                                  icon: const Icon(
                                    Icons.send,
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }
}

class RealTimeMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        child: StreamBuilder(
            stream: Client.readData(),
            builder: (context, snapshot) {
              if (snapshot.data?.image != null) {
                try {
                  var decode = base64.decode(snapshot.data!.image
                      .toString()
                      .replaceAll(RegExp(r'\s+'), ''));
                  return Image.memory(decode, gaplessPlayback: true);
                } catch (e) {
                  return Image.asset("assets/images/guzergah.png");
                }
              } else {
                return Image.asset("assets/images/guzergah.png");
              }
            }));
  }
}

class SensorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.red, Color(0x433D40)])),
        child: StreamBuilder(
            stream: Client.readData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                    child: Column(
                  children: [
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        newSensorText(
                            snapshot.data!.battery.toString(), context),
                        Spacer(),
                        newSensorText(
                            snapshot.data!.qrlist.toString(), context),
                        Spacer(),
                        newSensorText(
                            snapshot.data!.startTimeSecond.toString(), context),
                        Spacer()
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        Spacer(),
                        newSensorText(
                            snapshot.data!.temperature.toString(), context),
                        Spacer(),
                        newSensorText(snapshot.data!.speed.toString(), context),
                        Spacer(),
                        newSensorText("sa", context),
                        Spacer()
                      ],
                    ),
                    Spacer()
                  ],
                ));
              } else {
                return Text("data");
              }
            }));
  }

  Center newSensorText(String data, BuildContext context,
      [Color clr = Colors.black87]) {
    final height = MediaQuery.of(context).size.height * 0.1;
    final width = MediaQuery.of(context).size.width * 0.15;
    return Center(
        child: Container(
      height: height,
      width: width,
      color: clr,
      child: Row(
        children: [
          Icon(
            Icons.ac_unit,
            size: height * 0.5,
            color: Color(0xff6d2af7),
          ),
        ],
      ),
    ));
  }
}

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
