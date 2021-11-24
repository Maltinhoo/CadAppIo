import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_bar/helpers/validators.dart';
import 'package:food_bar/models/user.dart';
import 'package:food_bar/models/user_manager.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        actions: [
          FlatButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/typeaccount');
              },
              textColor: Colors.white,
              child: Text(
                'Criar Conta',
                style: TextStyle(fontSize: 15),
              ))
        ],
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [const Color(0xffff0000), const Color(0xff520202)])),
        ),
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 25,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(

              builder: (_, userManager, child){
                return ListView(
                  padding: const EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      controller: emailController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'E-mail'),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if (!emailValid(email)) return 'E-mail Inválido';
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      keyboardType: TextInputType.visiblePassword,
                      autocorrect: false,
                      obscureText: true,
                      validator: (pass) {
                        if (pass.isEmpty || pass.length < 6)
                          return 'Senha Inválida';
                        return null;
                      },
                    ),
                    child,
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        color: const Color(0xffff0000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: userManager.loading ? null : () {
                          if (formKey.currentState.validate()) {
                            userManager.signIn(
                                user: Usuario(
                                    email: emailController.text,
                                    password: passController.text),
                                onFail: (e) {
                                  scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Falha ao entrar: $e'),
                                    backgroundColor: Colors.red,
                                  ));
                                },
                                onSuccess: () {
                                  Navigator.of(context).pop();
                                });
                          }
                        },
                        disabledColor: Color(0xffaf6666),
                        textColor: Colors.white,
                        child: userManager.loading ?
                            const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Color(
                                  0xffffffff)),
                            ) :
                        const Text(
                          'Entrar',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    )
                  ],
                );
              },
              child: Align(
                alignment: Alignment.centerRight,
                child: FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.zero,
                  child: const Text('Esqueci minha senha'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
