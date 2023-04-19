import 'package:flutter/material.dart';

class LayoutRoute extends StatefulWidget {
  const LayoutRoute({super.key});

  @override
  State<StatefulWidget> createState() => _LayoutRoute();
}

class _LayoutRoute extends State<LayoutRoute> {
  Widget redBox =
      const DecoratedBox(decoration: BoxDecoration(color: Colors.red));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("layoutRoute"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 50.0, minWidth: 80),
              child: SizedBox(
                height: 60,
                child: redBox,
              ),
            ),
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      color: Colors.red,
                    )),
                Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      color: Colors.green,
                    ))
              ],
            ),
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                Chip(
                    label: Text("鸣人"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("M", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("佐助"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("Z", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("小樱"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("X", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("好色仙人"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("H", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("卡卡西"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("K", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("纲手"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("G", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("宇智波鼬"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("Y", style: TextStyle(color: Colors.white)))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
