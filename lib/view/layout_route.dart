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
            const Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: [
                Chip(
                    label: Text("路飞，蛇人形态"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("M", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("索隆，三刀流"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("Z", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("山治，火腿"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("X", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("娜美"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("H", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("乔巴"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("K", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("罗宾"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("G", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("佛兰奇"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("Y", style: TextStyle(color: Colors.white)))),
                Chip(
                    label: Text("布鲁克"),
                    avatar: CircleAvatar(
                        backgroundColor: Colors.blue,
                        child:
                            Text("Y", style: TextStyle(color: Colors.white)))),
              ],
            ),
            const Wrap(
              spacing: 20,
              runSpacing: 4,
              alignment: WrapAlignment.start,
              children: [
                Text("xuzhen"),
                Text("xuzhen123"),
                Text("xuzhen456"),
                Text("xuzhen789"),
                Text("xuzhen101112"),
                Text("xuzhen131415"),
                Text("xuzhen161718"),
                Text("xuzhen161718xuzhen161718xu"),
                Text("xuzhen"),
                Text("xuzhen161718123"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
