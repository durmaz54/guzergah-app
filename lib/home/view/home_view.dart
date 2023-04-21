import 'package:flutter/material.dart';
import 'package:guzergah/home/components/ping_view.dart';
import 'package:guzergah/home/components/start.dart';
import 'package:guzergah/home/components/terminal.dart';
import 'package:guzergah/home/components/topbar.dart';
import 'package:guzergah/home/model/home.dart';
import 'package:guzergah/home/view-model/home_view_model.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:guzergah/home/components/realtimemap.dart';
import 'package:guzergah/home/components/sensor_view.dart';
import 'package:guzergah/home/view/home_painter.dart';
import 'package:guzergah/home/components/taskwidget.dart';

class HomeView extends StatelessWidget {
  HomeViewModel _viewModel = HomeViewModel();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height / 100;
    final width = MediaQuery.of(context).size.width / 100;
    return Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
        Color.fromARGB(255, 23, 26, 33),
        Color.fromARGB(235, 23, 26, 33),
      ])),
      child: Column(
        children: [
          TopBar(height: height * 15, width: width * 100),
          Row(
            children: [
              Spacer(),
              Column(
                children: [
                  RealTimeMap(
                      height: height * 50,
                      width: width * 50,
                      clr: Colors.orange),
                  StartButton(height: height * 5, width: width * 10),
                  Terminal(height: height * 20, widht: width * 40)
                ],
              ),
              Spacer()
            ],
          ),
        ],
      ),
    );
  }
}
