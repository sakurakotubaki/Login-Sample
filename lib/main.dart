import 'package:flutter/material.dart';
import 'package:todo/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ログイン画面"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("ToDoアプリ", style: TextStyle(fontSize: 50),),
                  Text("ログインしてください。"),
                ],
              ),
          ),
          CustomTextField(label: "メールアドレス"),
          CustomTextField(label: "パスワード"),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("新規登録は"), TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Registration()));
            }, child: Text("こちら"),)]),
          ElevatedButton(
              onPressed: (){},
              child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text("ログイン", textAlign: TextAlign.center,)))
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  String label;

  CustomTextField({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (newText){},
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16))
            )
          ),
        ),
    );
  }
}
