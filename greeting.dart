import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GreetingPage extends StatefulWidget {
  const GreetingPage({Key? key}) : super(key: key);


  @override
  _GreetingPageState createState() => _GreetingPageState();
}

class _GreetingPageState extends State<GreetingPage> {

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("🎉 УРА! 🎉 УРА! 🎉"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(60.0),
        child: Center(
          child: Column(
            children: [
              Text('😺 😽 😻 😹'),
              SizedBox(height: 20.0,),
              Text('Форма успешно отправлена!',
                style: TextStyle(fontSize: 20.0, color: Colors.amber,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 20.0,),
              ElevatedButton(
                  onPressed: () {
                    SystemNavigator.pop();
                    },
                  child: const Text('Выйти'))
            ],
          ),
        ),
      ),
    );
  }
}