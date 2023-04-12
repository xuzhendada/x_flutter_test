import 'package:flutter/material.dart';

class NewRoute extends StatefulWidget {
  const NewRoute({super.key});

  @override
  State<StatefulWidget> createState() => _NewRouteState();
}

class _NewRouteState extends State<NewRoute> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();
  final GlobalKey _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(
            "New Route",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Form(
          key: _key,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                autofocus: true,
                controller: _nameEditingController,
                decoration: const InputDecoration(
                    labelText: "请输入用户名",
                    hintText: "用户名或邮箱",
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.person)),
                validator: (v) {
                  return v!.trim().isNotEmpty ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                autofocus: true,
                controller: _passwordEditingController,
                decoration: const InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)),
                validator: (v) {
                  return v!.trim().length > 5 ? null : "密码不能小于6位数";
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                      child: const Text("登录"),
                      onPressed: () {
                        if ((_key.currentState as FormState).validate()) {
                          debugPrint(
                              "用户名是：${_nameEditingController.text} -- 密码是 ${_passwordEditingController.text}");
                        }
                      },
                    ))
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint(
                        "用户名是：${_nameEditingController.text} -- 密码是 ${_passwordEditingController.text}");
                  },
                  child: const Text("登录"),
                ),
              )
            ],
          ),
        ));
  }
}
