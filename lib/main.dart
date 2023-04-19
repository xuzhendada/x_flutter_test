import 'package:flutter/material.dart';
import 'package:x_flutter_test/models/banner_entity.dart';
import 'package:x_flutter_test/net/apiConfig.dart';
import 'package:x_flutter_test/net/requestClient.dart';
import 'package:x_flutter_test/view/layout_route.dart';
import 'package:x_flutter_test/view/new_route.dart';
import 'package:x_flutter_test/view/scaffold_route.dart';
import 'package:x_flutter_test/view/tip_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;
  var _acc = 10;
  bool _switchSelected = true;
  bool _checkboxSelected = true;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _acc++;
      debugPrint("$_acc");
    });
  }

  void navigateToNewRoute() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const NewRoute();
    }));
  }

  void navigateTipRoute() async {
    var result =
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const TipRoute(
        text: "我是提示",
        key: Key("value"),
      );
    }));
    debugPrint("路由返回值 ：$result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
          maxLines: 1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Center(
              child: ElevatedButton(
                  onPressed: navigateTipRoute,
                  child: const Text("打开提示页面")),
            ),
            Text(
              'You have pushed the button this many time:' * 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  height: 1.5,
                  background: Paint()
                    ..color = Colors.black12,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            Text(
              '$_counter ',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineMedium,
            ),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.construction_rounded)),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const LayoutRoute();
                  }));
                },
                icon: const Icon(Icons.savings_sharp),
                label: const Text("Layout Route")),
            OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ScaffoldRoute();
                  }));
                },
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text("下载")),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text("下载")),
            FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.save_alt_outlined),
                label: const Text("下载")),
            const Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 50,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,
            ),
            Row(
              children: <Widget>[
                Text(
                  '$_acc',
                  style: Theme
                      .of(context)
                      .textTheme
                      .headlineMedium,
                ),
                TextButton(
                    onPressed: navigateToNewRoute,
                    child: const Text("open new route")),
                const Text("data"),
                const Text("data"),
                const Column(children: [
                  Text("child"),
                  Text("child"),
                ]),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Switch(
                        value: _switchSelected,
                        onChanged: (value) {
                          setState(() {
                            _switchSelected = value;
                          });
                        }),
                    Text(_switchSelected ? "开" : "关")
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                        value: _checkboxSelected,
                        onChanged: (onChanged) {
                          setState(() {
                            _checkboxSelected = onChanged!;
                          });
                        }),
                    Text(_checkboxSelected ? "选中" : "未选中")
                  ],
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
