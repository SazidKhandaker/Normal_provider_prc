import 'package:day26/modelclass.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Modelclass modelclass = Modelclass();

  getdatafromprovider() async {
    modelclass.dataset = await Modelclass.getdata();
  }

  @override
  void initState() {
    getdatafromprovider();
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Modelclass())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Myclass(),
      ),
    );
  }
}

class Myclass extends StatefulWidget {
  const Myclass({super.key});

  @override
  State<Myclass> createState() => _MyclassState();
}

class _MyclassState extends State<Myclass> {
  @override
  Widget build(BuildContext context) {
    var click = Provider.of<Modelclass>(
      context,
    ).themdata;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${click ? "Chnage background" : "Same background"}"),
          SwitchListTile(
            value: click,
            onChanged: (value) {
              Provider.of<Modelclass>(context, listen: false).dataset = value;
              print(value);
              click = value;
            },
          )
        ],
      ),
    );
  }
}
