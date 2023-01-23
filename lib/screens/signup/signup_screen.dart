import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/signup/components/field_title.dart';
import 'package:xlo_mobx/stores/signup_store.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  // local service instance
  //final SignupStore signupStore = SignupStore();

  // global service instance
  final signupStore = GetIt.I<SignupStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            margin: EdgeInsets.symmetric(horizontal: 32),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 22, 16, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FieldTitle(
                    title: 'Apelido',
                    subtitle: 'Como aparecerá em seus anúncios',
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: signupStore.name,
                      decoration: InputDecoration(
                        hintText: 'Exemplo: João P.',
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 9,
                        ),
                        errorText: signupStore.nameError,
                      ),
                      onChanged: signupStore.setname,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'E-mail',
                    subtitle: 'Enviaremos um e-mail de confirmação',
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: signupStore.email,
                      decoration: InputDecoration(
                        hintText: 'Exemplo: joao@gmail.com',
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 9,
                        ),
                        errorText: signupStore.emailError,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      onChanged: signupStore.setEmail,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Celular',
                    subtitle: 'Proteja sua conta',
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: signupStore.phone,
                      decoration: InputDecoration(
                          hintText: 'Exemplo: (99) 99999-9999',
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 9,
                          ),
                          errorText: signupStore.phoneError),
                      keyboardType: TextInputType.phone,
                      autocorrect: false,
                      onChanged: signupStore.setPhone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        TelefoneInputFormatter()
                      ],
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Senha',
                    subtitle: 'Use letras, números e caracteres especiais',
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: signupStore.pass1,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 9,
                          ),
                          errorText: signupStore.pass1Error),
                      obscureText: true,
                      onChanged: signupStore.setPass1,
                    );
                  }),
                  const SizedBox(height: 16),
                  FieldTitle(
                    title: 'Confirmar senha',
                    subtitle: 'Repita a senha',
                  ),
                  Observer(builder: (_) {
                    return TextFormField(
                      initialValue: signupStore.pass2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 9,
                        ),
                        errorText: signupStore.pass2Error,
                      ),
                      obscureText: true,
                      onChanged: signupStore.setPass2,
                    );
                  }),
                  const SizedBox(height: 16),
                  Observer(builder: (_) {
                    return Container(
                      height: 40,
                      margin: EdgeInsets.only(top: 12, bottom: 4),
                      child: ElevatedButton(
                        onPressed: signupStore.signUpPressed,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Text('CADASTRAR'),
                      ),
                    );
                  }),
                  Divider(
                    color: Colors.grey,
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        'Já tem uma conta? ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 0),
                        ),
                        onPressed: Navigator.of(context).pop,
                        child: Text(
                          'Entrar',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
