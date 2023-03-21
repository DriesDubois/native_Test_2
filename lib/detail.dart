import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DetailPage extends StatefulWidget {
  final String characterName;
  final String gender;
  final String id;

  const DetailPage(this.characterName, this.gender, this.id);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late Animation<double> animatie;
  late AnimationController animatieController;

  void initState() {
    animatieController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animatie = Tween<double>(begin: 0, end: 52).animate(animatieController);
    animatie.addListener(() {
      setState(() {});
    });
    animatieController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.characterName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: CachedNetworkImage(
            placeholder: (context, url) => const CircularProgressIndicator(),
            imageUrl: "https://picsum.photos/200?image=" + widget.id,
          )),
          Expanded(
            child: Icon(
                size: animatie.value,
                color: animatie.value < 20
                    ? Colors.black
                    : widget.gender == "male"
                        ? Colors.blue
                        : Colors.pink,
                widget.gender == "male" ? Icons.male : Icons.female),
          )
        ]),
      ),
    );
  }
}
