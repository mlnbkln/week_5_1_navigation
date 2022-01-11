import 'package:flutter/material.dart';

import 'greeting.dart';

enum GenderList {male, female}

void main() => runApp(
    new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            appBar: new AppBar(
                title: new Text('Опросник для обладателей котиков'),
            centerTitle: true),
            body: new MyForm()
            )
        )
);

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

@override
State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
final _formKey = GlobalKey<FormState>();
GenderList _gender = GenderList.male;
bool _foodDry = false;
bool _foodWet = false;
bool _foodNat = false;

@override
Widget build(BuildContext context) {
return Container(
      padding: EdgeInsets.all(2.0),
      child: Form(
          key: _formKey,
      child: SingleChildScrollView(
          child: new Column(children: [
            new Text('Кличка вашего питомца:',
              style: TextStyle(fontSize: 10.0),),
            new TextFormField(validator: (value){
              if (value!.isEmpty)
                return 'Пожалуйста введите кличку своего питомца';
            }),
            new SizedBox(height: 1.0),
            new Text('Имя владельца:',
              style: TextStyle(fontSize: 10.0),),
            new TextFormField(validator: (value) {
              if (value!.isEmpty) return 'Пожалуйста введите свое имя';
            }),
            new SizedBox(height: 1.0),
            new Text('Контактный E-mail:',
              style: TextStyle(fontSize: 10.0),),
            new TextFormField(validator: (value){
              if (value!.isEmpty) return 'Пожалуйста введите свой E-mail';
              if (!value.contains('@')) return 'Это не E-mail';
            }),
            new SizedBox(height: 1.0),
            new Text('Порода питомца:',
              style: TextStyle(fontSize: 10.0),),
            new TextFormField(validator: (value){
              if (value!.isEmpty) return 'Пожалуйста введите породу своего питомца';
            }),
            new SizedBox(height: 1.0),
            new Text('Чем питается питомец:',
              style: TextStyle(fontSize: 10.0),),
            new CheckboxListTile(
                value: _foodDry,
                title: new Text ('Сухой корм', style: TextStyle(fontSize: 10.0),),
                onChanged: (bool? value) => setState(() => _foodDry = value!)),
            new CheckboxListTile(
                value: _foodWet,
                title: new Text ('Влажные корм', style: TextStyle(fontSize: 10.0),),
                onChanged: (bool? value) => setState(() => _foodWet = value!)),
            new CheckboxListTile(
                value: _foodNat,
                title: new Text ('Натуральный корм', style: TextStyle(fontSize: 10.0),),
                onChanged: (bool? value) => setState(() => _foodNat = value!)),
            new SizedBox(height: 1.0),
            new Text('Пол питомца:', style: TextStyle(fontSize: 10.0),),
            new RadioListTile(
              title: const Text('Самец', style: TextStyle(fontSize: 10.0),),
              value: GenderList.male,
              groupValue: _gender,
              onChanged: (GenderList? value) {
                setState(() { _gender = value!;});
                },),
            new RadioListTile(
              title: const Text('Самка', style: TextStyle(fontSize: 10.0),),
              value: GenderList.female,
              groupValue: _gender,
              onChanged: (GenderList? value) {setState(() { _gender = value!;});},
            ),
            new SizedBox(height: 1.0),
            new ElevatedButton(
              child: Text('Сохранить'),
              onPressed: () {
                String text = 'Опросник успешно заполнен';

                if(!_formKey.currentState!.validate() ||
//if (_gender == null) text = 'Выберите пол своего питомца';
                    !_foodDry && !_foodWet && !_foodNat) {
                  text = 'Необходимо выбрать питание питомца';
                  Color textColor = Colors.red;



Scaffold.of(context).showSnackBar(SnackBar(
  content: Text(text),
  duration: const Duration(seconds: 1),
  backgroundColor: textColor,
  action: SnackBarAction(
    label: "Ok",
    textColor: Colors.blueGrey,
    onPressed: () {},
  ),
));
}
else {
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GreetingPage()),
      );
}
},
)],))));
}
}




