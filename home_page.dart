

import 'package:flutter/material.dart';
// import 'package:tarea1/main.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();


}

class _HomePageState extends State<HomePage> {
  bool btn_persona = false;
  bool btn_timer = false;
  bool btn_tel1 = false;
  bool btn_tel2 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mc Flutter'),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2,
            )
          ),
          child: Column (
            mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.account_circle, size: 48),
                Column(
                  children: const [
                    Text("Flutter McFlutter", style: TextStyle (fontSize: 23),),
                    Text("Experienced App Developer")
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("123 Main Street"),
                Text("(415) 555-0198"),
              ],
            ),
            Row (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.accessibility),
                  color: btn_persona ? Colors.indigo : Colors.black,
                  onPressed: () {
                    if (btn_persona == false) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Únete a un club con otras personas"),
                        )
                          
                      );
                    }
                    setState(() {
                      btn_persona = !btn_persona;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.timer),
                  color: btn_timer ? Colors.indigo : Colors.black,
                  onPressed: () {
                    if (btn_timer == false) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Cuenta regresiva para el evento: 31 días"),
                        )
                          
                      );
                    }
                    setState(() {
                      btn_timer = !btn_timer;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.phone_android),
                  color: btn_tel1 ? Colors.indigo : Colors.black,
                  onPressed: () {
                    if (btn_tel1 == false) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Llama al número 4155550198"),
                        )
                          
                      );
                    }
                    setState(() {
                      btn_tel1 = !btn_tel1;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.phone_android),
                  color: btn_tel2 ? Colors.indigo : Colors.black,
                  onPressed: () {
                    if (btn_tel2 == false) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(const SnackBar(
                          content: Text("Llama al celular 3317865113"),
                        )
                          
                      );
                    }
                    setState(() {
                      btn_tel2 = !btn_tel2;
                    });
                  },
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}