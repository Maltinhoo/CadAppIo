import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TypeAccountScreen extends StatelessWidget {
  const TypeAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha o tipo de conta'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [const Color(0xffff0000), const Color(0xff520202)])),
        ),
      ),
      body: Center(
        child: Card(
          elevation: 10,
          shadowColor: Colors.black,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: const Color(0xffff0000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    disabledColor: Color(0xffaf6666),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: const Text('Criar conta como Cliente'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  child: RaisedButton(
                    color: const Color(0xffff0000),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),

                    disabledColor: Color(0xffaf6666),
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signupcompany');
                    },
                    child: const Text('Criar conta como Empresa'),
                  ),
                ),
              ),
            ],

          ),
        ),
      ),
    );
  }
}
