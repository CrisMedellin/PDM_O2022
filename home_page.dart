import 'package:flutter/material.dart';
void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
   HomePage({
    Key? key,
  }) : super(key: key);

  int likes_counter = 0;
  MaterialColor likes_color = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            Image.network(
                "https://www.cisco.com/c/es_mx/about/case-studies-customer-success-stories/iteso/jcr:content/Grid/category_atl_26d4/layout-category-atl/marquee_inpage_505b.img.jpg/1651747308061.jpg"),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "El ITESO, Universidad Jesuita de Guadalajara",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "San Pedro Tlaquepaque, Jal.",
                      style: TextStyle(color: Colors.grey[500], fontSize: 11),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {
                      print(likes_counter);
                     if (likes_counter < 999) likes_counter++;
                      likes_color = Colors.blue;
                    },
                    iconSize: 25,
                    icon: Icon(
                      Icons.thumb_up,
                      color: likes_color
                    )),
                Text("$likes_counter"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.mail),
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(const SnackBar(
                              content: Text("Enviando correo..."),
                            ));
                        },
                      ),
                      const Text("Correo"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.add_call),
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text("Hacer llamada"),
                          ));
                        },
                      ),
                      const Text("Llamar"),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        iconSize: 48,
                        icon: const Icon(Icons.directions),
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(const SnackBar(
                            content: Text("Ir al ITESO"),
                          ));
                        },
                      ),
                      const Text("Ruta"),
                    ],
                  ),
                ],
              ),
            ),
            const Text(
              "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es ina universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año de 1957.",
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
