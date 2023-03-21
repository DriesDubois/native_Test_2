import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String characterName;
  const DetailPage (this.characterName);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(widget.characterName),),);
  }
}