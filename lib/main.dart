import 'package:flutter/material.dart';
import 'package:x_flutter_test/models/banner_entity.dart';
import 'package:x_flutter_test/net/apiConfig.dart';
import 'package:x_flutter_test/net/requestClient.dart';

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
  final RequestClient _requestClient = RequestClient();
  void _incrementCounter() {
    setState(() {
      _counter++;
      _acc++;
      debugPrint("$_acc");
    });
    getBanner();
  }
  Future<void> getBanner() async {
    BannerEntity? bannerEntity = await _requestClient.get<BannerEntity>(ApiConfig().bannerUrl);
    debugPrint(bannerEntity.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent),
          maxLines: 1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Text(
              'You have pushed the button this many time1:',
            ),
            Text(
              '$_counter ',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              children: <Widget>[
                Text(
                  '$_acc',
                  style: Theme.of(context).textTheme.headlineMedium,

                ),
                const Text("data"),
                const Text("data"),
                const Text("data"),
                const Text("data"),
                const Text("data"),
                const Column(
                  children: [
                    Text("child"),
                    Text("child"),
                    Text("child"),
                    Text("child"),
                  ]
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
