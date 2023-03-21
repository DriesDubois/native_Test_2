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

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.characterName),
        ),
        body: Row(children: [Expanded(child: CachedNetworkImage(
        placeholder: (context, url) => const CircularProgressIndicator(),
    imageUrl: "https://picsum.photos/200?image="+widget.id,
    )),Expanded(child: Icon(size: 52,color:widget.gender=="male"?Colors.blue:Colors.pink ,widget.gender=="male"?Icons.male:Icons.female))]),
    );
  }
}
