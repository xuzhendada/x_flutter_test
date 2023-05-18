import 'package:flutter/material.dart';

class ListViewRoute extends StatefulWidget {
  const ListViewRoute({super.key});

  @override
  State<StatefulWidget> createState() => _ListViewRoute();
}

class _ListViewRoute extends State<ListViewRoute> {
  @override
  Widget build(BuildContext context) {
    Widget di1 = const Divider(
      color: Colors.blue,
    );
    Widget di2 = const Divider(
      color: Colors.green,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text("ListViewRoute"),
        ),
        body:
            /*ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return const ListTile(title: Text("index"));
              },
              itemCount: 30,
              itemExtent: 50,
            ),*/
            ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return const ListTile(title: Text("xudazhen"));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return index % 2 == 0 ? di1 : di2;
                },
                itemCount: 100)
        );
  }
}
