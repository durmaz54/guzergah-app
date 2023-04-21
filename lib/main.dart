import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guzergah/home/view/home_view.dart';
import 'package:guzergah/home/services/client.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();
  final a = windowManager.getSize();

  WindowOptions windowOptions = WindowOptions(
    center: true,
    backgroundColor: Colors.transparent,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.setAspectRatio(16 / 9);
  windowManager.setMinimumSize(Size(1280, 720));
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
  });

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
        //appBar: newAppBar(),
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
