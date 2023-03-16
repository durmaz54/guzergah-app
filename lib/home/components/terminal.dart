import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';

class Terminal extends StatelessWidget {
  final height, widht;
  Terminal({required this.height, required this.widht});
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0x2F4551),
        border: Border.all(
            style: BorderStyle.solid, width: 1, color: Colors.black26),
      ),
      height: height,
      width: widht,
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
    );
  }
}
