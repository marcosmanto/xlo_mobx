import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../components/error_box.dart';
import '../../main.dart';
import '../../stores/signup_store.dart';
import 'components/field_title.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // global service instance
  final signupStore = GetIt.I<SignupStore>();

  @override
  void initState() {
    super.initState();
    reaction((_) => signupStore.loading, (loading) {
      if (loading == false) {
        //Hide immediately snackbar if there is one
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => WillPopScope(
        onWillPop: signupStore.loading
            ? () async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Por favor aguarde o processo de cadastro terminar'),
                ));
                return false;
              }
            : null,
        child: Scaffold(
          appBar: AppBar(
            title: Text(signupStore.loading ? 'Aguarde' : 'Cadastro'),
            centerTitle: true,
          ),
          body: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
                margin: EdgeInsets.symmetric(horizontal: 32),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 22, 16, 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (gDebug && signupStore.error != null)
                        ElevatedButton(
                          onPressed: signupStore.clearError,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            elevation: 0,
                          ),
                          child: Text('Limpar erro'),
                        ),
                      ErrorBox(message: signupStore.error),
                      FieldTitle(
                        title: 'Apelido',
                        subtitle: 'Como aparecerá em seus anúncios',
                        textColor: signupStore.textColor,
                      ),
                      TextFormField(
                        style: TextStyle(color: signupStore.textColor),
                        enabled: !signupStore.loading,
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
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'E-mail',
                        subtitle: 'Enviaremos um e-mail de confirmação',
                        textColor: signupStore.textColor,
                      ),
                      TextFormField(
                        style: TextStyle(color: signupStore.textColor),
                        enabled: !signupStore.loading,
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
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'Celular',
                        subtitle: 'Proteja sua conta',
                        textColor: signupStore.textColor,
                      ),
                      TextFormField(
                        style: TextStyle(color: signupStore.textColor),
                        enabled: !signupStore.loading,
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
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'Senha',
                        subtitle: 'Use letras, números e caracteres especiais',
                        textColor: signupStore.textColor,
                      ),
                      TextFormField(
                        style: TextStyle(color: signupStore.textColor),
                        enabled: !signupStore.loading,
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
                      ),
                      const SizedBox(height: 16),
                      FieldTitle(
                        title: 'Confirmar senha',
                        subtitle: 'Repita a senha',
                        textColor: signupStore.textColor,
                      ),
                      TextFormField(
                        style: TextStyle(color: signupStore.textColor),
                        enabled: !signupStore.loading,
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
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          return Container(
                            alignment: Alignment.center,
                            height: 40,
                            margin: EdgeInsets.only(top: 12, bottom: 4),
                            child: signupStore.loading
                                ? Transform.translate(
                                    offset: Offset(0, -9),
                                    child: SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: CircularProgressIndicator(
                                        strokeWidth:
                                            gCircularProgressStrokeWidh,
                                      ),
                                    ),
                                  )
                                : ConstrainedBox(
                                    constraints: BoxConstraints(
                                        minWidth: constraints.maxWidth),
                                    child: ElevatedButton(
                                      onPressed: signupStore.signUpPressed,
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: signupStore.loading
                                            ? Colors.transparent
                                            : Theme.of(context)
                                                .colorScheme
                                                .primary,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Text('CADASTRAR'),
                                    ),
                                  ),
                          );
                        },
                      ),
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
                              color: signupStore.loading ? Colors.grey : null,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 0),
                            ),
                            onPressed: signupStore.loading
                                ? null
                                : Navigator.of(context).pop,
                            child: Text(
                              'Entrar',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: signupStore.loading
                                    ? Colors.grey
                                    : Theme.of(context).colorScheme.primary,
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
        ),
      ),
    );
  }
}
