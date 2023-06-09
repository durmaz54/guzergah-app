import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';

class SensorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      color: clr,
      child: Row(
        children: [
          Icon(
            Icons.ac_unit,
            color: Color(0xff6d2af7),
          ),
        ],
      ),
    ));
  }
}
