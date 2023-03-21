import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/detail.dart';

// import 'package:flutter_application_2/models/enums.dart';
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
  Map<String, String> lijstMap = {
    'all': "all",
    'Resistance': 'Resistance',
    'Sith': "Sith",
    'Jedi Order': 'Jedi Order'
  };
  late String affiliation = "all";

  @override
  Widget build(BuildContext context) {
    List<DropdownMenuItem<String>> opties = <DropdownMenuItem<String>>[];
    lijstMap.keys.forEach((element) {
      opties.add(DropdownMenuItem(child: Text(element), value: element));
    });

    return Scaffold(
      appBar: AppBar(
          title: Center(
        child: Text("Star Wars Characters"),
      )),
      body: Container(
        child: Column(
          children: [
            Text("Select a side:"),
            Center(
              child: DropdownButton(
                  items: opties,
                  value: affiliation,
                  onChanged: (value) {
                    setState(() {
                      affiliation = value!;
                    });
                  }),
            ),
            Text("There are ${characters.length} characters!"),
            Expanded(
                child:
                    Container(height: 500, child: CharacterList(affiliation)))
          ],
        ),
      ),
    );
  }
}

class CharacterList extends StatefulWidget {
  final String affiliation;

  const CharacterList(this.affiliation);

  @override
  State createState() => _CharacterListState();
}

class _CharacterListState extends State<CharacterList> {
  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: characters.length,
        itemBuilder: (BuildContext context, int index) {
          if (widget.affiliation == "all") {
            return ListTile(
              // leading: Image.asset(characters[index].imageAsset),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailPage(characters[index]["name"],characters[index]["gender"],characters[index]["id"].toString())),
                );
              },
              leading: CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(),
                imageUrl: "https://picsum.photos/200?image="+characters[index]["id"].toString(),
              ),
              title: Text(characters[index]["name"]),
            );
          } else {
            if (characters[index]["affiliations"]
                .contains(widget.affiliation)) {
              return ListTile(
                // leading: Image.asset(characters[index].imageAsset),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetailPage(characters[index]["name"],characters[index]["gender"],characters[index]["id"].toString())),
                  );
                },
                leading: CachedNetworkImage(
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  imageUrl: "https://picsum.photos/200?image="+characters[index]["id"].toString(),
                ),
                title: Text(characters[index]["name"]),
              );
            }
          }
        },
      );
}
