import 'package:flutter/material.dart';

class ScaffoldRoute extends StatefulWidget {
  const ScaffoldRoute({super.key});

  @override
  State<StatefulWidget> createState() => _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 1;
  late TabController _tabController;
  List tabs = ["Home", "business", "school", "person"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ScaffoldRoute"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
        ],
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.assistant_direction), label: "s"),
            BottomNavigationBarItem(icon: Icon(Icons.location_on_outlined), label: "人员定位"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "我的"),
          ],
          currentIndex: _tabController.index,
          fixedColor: Colors.blue,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.black),
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5),
          );
        }).toList(),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _tabController.index = index;
      _selectIndex = index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class Widget1 extends Widget {
  const Widget1({super.key});

  @override
  Element createElement() {
    // TODO: implement createElement
    throw UnimplementedError();
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "images/logo.png",
                        width: 80,
                      ),
                    ),
                  ),
                  const Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
