import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:todo/firebase_options.dart';
import 'package:todo/registration.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // const MyHomePage({Key? key}) : super(key: key);
  String? mailAddress;
  String? password;
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
          CustomTextField(label: "メールアドレス", onChangedfunc: (newText){mailAddress = newText;},isPassword: false,),
          CustomTextField(label: "パスワード", onChangedfunc: (newText){password = newText;},isPassword: true,),
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
  void Function(String text) onChangedfunc;
  bool isPassword;

  CustomTextField({
    required this.label,
    required this.onChangedfunc,
    required this.isPassword,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          onChanged: (newText){
            onChangedfunc(newText);
          },
          obscureText: isPassword? true : false,
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
