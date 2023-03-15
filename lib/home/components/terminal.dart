import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';
import 'package:guzergah/home/services/client.dart';

class Terminal extends StatelessWidget {
  var _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
