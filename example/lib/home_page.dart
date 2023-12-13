import 'package:dummy_gen/dummy_gen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  // final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget buildTile(
      String name,
      String data, {
      String? imageUrl,
    }) {
      return ListTile(
        title: Text(name),
        subtitle: Text(data),
        trailing: imageUrl != null
            ? Image.network(
                imageUrl,
                width: 100,
                height: 100,
              )
            : null,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("DummyGen Demo"),
      ),
      body: SingleChildScrollView(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Padding(
          padding: const EdgeInsets.only(top: 24, bottom: 64),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildTile("city", DummyGen.city),
              buildTile("province", DummyGen.province),
              buildTile("provinceCode", DummyGen.provinceCode),
              buildTile("state", DummyGen.state),
              buildTile("stateCode", DummyGen.stateCode),
              buildTile("street", DummyGen.street),
              buildTile("postal", DummyGen.postal),
              buildTile("address", DummyGen.address),
              buildTile("title", DummyGen.title),
              buildTile("subTitle", DummyGen.subTitle),
              buildTile("paragraph", DummyGen.paragraph),
              buildTile("image", DummyGen.image, imageUrl: DummyGen.image),
              buildTile("phone", DummyGen.phone),
              buildTile("email", DummyGen.email),
              buildTile("name", DummyGen.name),
              buildTile("dateFuture", DummyGen.dateFuture.toString()),
              buildTile("datePast", DummyGen.datePast.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
