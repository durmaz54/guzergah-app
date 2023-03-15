import 'package:flutter/material.dart';
import 'package:guzergah/home/view/home_view.dart';
import 'package:guzergah/home/services/client.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: newAppBar(),
        body: HomeView(),
      ),
    );
  }

  AppBar newAppBar() {
    return AppBar(
      title: Text("data"),
      actions: [
        StreamBuilder(
            stream: Client.ping(),
            builder: (context, snapshot) {
              return Text(snapshot.data.toString());
            })
      ],
    );
  }
}
