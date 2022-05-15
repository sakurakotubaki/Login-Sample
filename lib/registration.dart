import 'package:flutter/material.dart';
import 'package:todo/main.dart';

class Registration extends StatelessWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("新規登録"),
      ),
      body: Column(
        children: [
          CustomTextField(label: "メールアドレス"),
          CustomTextField(label: "パスワード"),
          CustomTextField(label: "パスワード確認"),
          ElevatedButton(
              onPressed: (){},
              child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("新規登録", textAlign: TextAlign.center,)))
        ],
      ),
    );
  }
}
