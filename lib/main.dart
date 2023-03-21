import 'package:flutter/material.dart';
import 'models/data.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Main());
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  Map<String, String> lijstMap = { 'all': "all", 'resistance': 'resistance', 'sith': "sith",'jediOrder':'jediOrder' };
  late String affiliation ="all";
  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> opties = <DropdownMenuItem<String>>[];
    lijstMap.keys.forEach((element) {
      opties.add(DropdownMenuItem(child: Text(element), value: element));
    });

    return Scaffold(
      appBar: AppBar(title:Center(child: Text("Star Wars Characters"),)),
      body: Container(
        child: Column(children: [Text("Select a side:"),
          Center(
            child: DropdownButton(items: opties,value:affiliation, onChanged: (value){
              setState(() {
                affiliation = value!;
              });
            }),
          )
        ,Text("There are ${characters.length} characters!"),Container(height:500,child:CharacterList())],),
      ),
    );
  }
}

class CharacterList extends StatefulWidget {
  @override
  State createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: characters.length,
    itemBuilder: (BuildContext context, int index) {
      return ListTile(
        // leading: Image.asset(characters[index].imageAsset),
        title: Text(characters[index]["name"]),
      );
    },
  );



}


