import 'package:flutter/material.dart';
import 'package:food_bar/helpers/validators.dart';
import 'package:food_bar/models/user.dart';
import 'package:food_bar/models/user_manager.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final maskPhoneFormatter = MaskTextInputFormatter(mask: '(##) #####-####');

  final Usuario user = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    const Color(0xffff0000),
                    const Color(0xff520202)
                  ])),
        ),
        title: const Text('Criar Conta'),
      ),
      body: Center(
        child: Card(
          elevation: 15,
          shadowColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_, userManager, __){
                return ListView(
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  children: [
                    TextFormField(
                      autocorrect: false,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(
                          hintText: 'Nome Completo'
                      ),
                      validator: (name){
                        if(name.isEmpty)
                          return 'Campo obrigatório';
                        else if (name.trim().split(' ').length <= 1)
                          return 'Preencha seu nome completo';
                        return null;
                      },
                      onSaved: (name)=> user.name = name,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(
                          hintText: 'E-mail'
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (email){
                        if (email.isEmpty)
                          return 'Campo obrigatório';
                        else if (!emailValid(email))
                          return 'E-mail inválido';
                        return null;
                      },
                      onSaved: (email) => user.email = email,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(
                          hintText: 'Telefone'
                      ),
                      inputFormatters: [maskPhoneFormatter],
                      keyboardType: TextInputType.phone,

                      validator: (phone){
                        if (phone.isEmpty)
                          return 'Campo obrigatório';
                        else if (phone.length > 15)
                          return 'Telefone incorreto';
                        else if (phone.length < 15)
                          return 'Telefone incompleto';
                        return null;
                      },
                      onSaved: (phone) => user.phone = phone,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(
                          hintText: 'Senha'
                      ),
                      obscureText: true,
                      validator: (pass){
                        if(pass.isEmpty)
                          return 'Campo obrigatório';
                        else if (pass.length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.password = pass,
                    ),
                    const SizedBox(height: 16,),
                    TextFormField(
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(
                          hintText: 'Repita a Senha'
                      ),
                      obscureText: true,
                      validator: (pass){
                        if(pass.isEmpty)
                          return 'Campo obrigatório';
                        else if (pass.length < 6)
                          return 'Senha muito curta';
                        return null;
                      },
                      onSaved: (pass) => user.confirmPassword = pass,
                    ),
                    const SizedBox(height: 16,),
                    SizedBox(
                      height: 44,
                      child: RaisedButton(
                        color: const Color(0xffff0000),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        disabledColor: Color(0xffaf6666),
                        textColor: Colors.white,
                        onPressed: userManager.loading ? null : (){
                          if(formKey.currentState.validate()){
                            formKey.currentState.save();

                            if(user.password != user.confirmPassword){
                              scaffoldKey.currentState.showSnackBar(
                                  SnackBar(
                                    content: const Text('Senhas não coincidem!'),
                                    backgroundColor: Colors.red,
                                  ));
                              return;
                            }
                            userManager.signUp(
                              user: user,
                              onSuccess: (){
                                Navigator.of(context).pop();
                              },
                              onFail: (e){
                                scaffoldKey.currentState.showSnackBar(
                                    SnackBar(
                                      content: Text('Falha ao cadastrar: $e'),
                                      backgroundColor: Colors.red,
                                    )
                                );
                              },
                            );
                          }
                        },
                        child: userManager.loading ?
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                            : const Text('Criar Conta', style: TextStyle(fontSize: 18),),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
