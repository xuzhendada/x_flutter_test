import 'package:flutter/material.dart';

class TipRoute extends StatefulWidget {
  const TipRoute({required Key key, required this.text}) : super(key: key);
  final String text;

  @override
  State<StatefulWidget> createState() => _TipRoute();
}

class _TipRoute extends State<TipRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("提示"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(widget.text),
            ElevatedButton(
                onPressed: () => Navigator.pop(context, "我是返回值"),
                child: const Text("Back")),
            Padding(
                padding: const EdgeInsets.only(top: 20),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation(Colors.black),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(Colors.black),
                value: 0.2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 200),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 200, bottom: 20),
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(Colors.black),
                value: 0.8,
              ),
            ),
            SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey.shade200,
                valueColor: const AlwaysStoppedAnimation(Colors.black),
              ),
            )
          ],
        ),
      ),
    );
  }
}
