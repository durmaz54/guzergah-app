import 'package:flutter/material.dart';
import 'package:guzergah/home/components/ping_view.dart';
import 'package:guzergah/home/components/terminal.dart';
import 'package:guzergah/home/components/topbar.dart';
import 'package:guzergah/home/model/home.dart';
import 'package:guzergah/home/view-model/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/components/realtimemap.dart';
import 'package:guzergah/home/components/sensor_view.dart';
import 'package:guzergah/home/view/home_painter.dart';

import '../components/taskwidget.dart';

class HomeView extends StatelessWidget {
  HomeViewModel _viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
            radius: 0.2, colors: [Colors.black38, Colors.black87]),
      ),
      child: Column(
        children: [
          TopBar(height: height * 15, width: width * 100),
          SizedBox(
            height: height * 10,
          ),
          Row(
            children: [
              Spacer(),
              Center(
                  child: Column(
                children: [
                  RealTimeMap(height: height * 45, width: width * 45),
                  SizedBox(
                    height: height * 5,
                  ),
                  PingView(height: height, width: width, state: false),
                ],
              )),
              Spacer()
            ],
          ),
        ],
      ),
    );
  }
}
