import 'package:flutter/material.dart';
import 'package:guzergah/home/components/terminal.dart';
import 'package:guzergah/home/model/home.dart';
import 'package:guzergah/home/view-model/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/components/realtimemap.dart';
import 'package:guzergah/home/components/sensor_view.dart';

import '../components/taskwidget.dart';

class HomeView extends StatelessWidget {
  HomeViewModel _viewModel = HomeViewModel();

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
                  Expanded(flex: 1, child: Terminal())
                ],
              ))
        ],
      ),
    );
  }
}
