import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpCompanyScreen extends StatelessWidget {
  SignUpCompanyScreen({Key key}) : super(key: key);

  final maskPhoneFormatter = MaskTextInputFormatter(mask: '(##) #####-####');
  final maskCnpjFormatter = MaskTextInputFormatter(mask: "##.###.###/####-##", filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: const Text('Criar Conta Empresarial'),
      ),
      body: Center(
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            padding: EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'Razão Social'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Nome Fantasia'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'CNPJ'),
                keyboardType: TextInputType.number,
                inputFormatters: [maskCnpjFormatter],
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Inscrição Estadual'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Endereço'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Bairro'),
              ),
              const SizedBox(height: 16,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 1,
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: 'Cidade'),
                      )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    flex: 1,
                      child: TextFormField(
                        decoration: const InputDecoration(hintText: 'Estado'),
                      ),
                  )
                ],
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Telefone'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Senha'),
                obscureText: true,
              ),
              const SizedBox(height: 16,),
              TextFormField(
                decoration: const InputDecoration(hintText: 'Confirmar Senha'),
                obscureText: true,
              ),
              SizedBox(height: 16,),
              SizedBox(
                height: 44,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  color: Color(0xffff0000),
                  disabledColor: Color(0xffaf6666),
                  textColor: Colors.white,
                  onPressed: (){ },
                  child: const Text(
                      'Criar Conta',
                    style: TextStyle(
                      fontSize: 18
                    ),
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
