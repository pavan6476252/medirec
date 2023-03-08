import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    this.text,
    this.name,
    this.type,
  });

  final String? text;
  final String? name;
  final bool? type;

  List<Widget> otherMessage(context) {
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: const CircleAvatar(child: Text('B')),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name ?? "",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text ?? ""),
            ),
          ],
        ),
      ),
    ];
  }

  List<Widget> myMessage(context) {
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(name ?? "", style: Theme.of(context).textTheme.titleSmall),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(text ?? ""),
            ),
          ],
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
            child: Text(
          name?[0] ?? "",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        )),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // decoration: BoxDecoration(border: Border.fromBorderSide(BorderSide())),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: type ?? false ? myMessage(context) : otherMessage(context),
        ),
      ),
    );
  }
}