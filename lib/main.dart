import 'package:flutter/material.dart';
import 'package:guzergah/home/view/home_view.dart';
import 'package:guzergah/home/services/client.dart';

void main() {
  //Isolate.spawn(test, viewModel);
  runApp(MyApp());
}

/*

void test(HomeViewModel model) async {
  while (true) {
    var url = 'http://127.0.0.1:5000/map';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode != 404) {
      model.changeImage(url);
      print(response.statusCode);
    }
  }
}

void handleTimeout() {
  print("timeout callback");
} */

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
        appBar: AppBar(
          title: Text("data"),
          actions: [
            StreamBuilder(
                stream: Client.ping(),
                builder: (context, snapshot) {
                  return Text(snapshot.data.toString());
                })
          ],
        ),
        body: HomeView(),
      ),
    );
  }
}
