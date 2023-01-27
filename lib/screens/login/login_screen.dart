import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import '../../main.dart';

import '../../components/message_box.dart';
import '../../stores/login_store.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // global service instance
  final loginStore = GetIt.I<LoginStore>();

  @override
  void initState() {
    super.initState();
    reaction((_) => loginStore.loading, (loading) {
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
        onWillPop: loginStore.loading
            ? () async {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content:
                      Text('Por favor aguarde o processo de login terminar'),
                ));
                return false;
              }
            : null,
        child: Scaffold(
          appBar: AppBar(
            title: Text(loginStore.loading ? 'Aguarde' : 'Entrar'),
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
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 5),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (gDebug && loginStore.error != null)
                        ElevatedButton(
                          onPressed: loginStore.clearError,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            elevation: 0,
                          ),
                          child: Text('Limpar erro'),
                        ),
                      MessageBox(
                        message: loginStore.error,
                      ),
                      Text(
                        'Acessar com E-mail:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: loginStore.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3, bottom: 4, top: 16),
                        child: Text(
                          'E-mail',
                          style: TextStyle(
                            color: loginStore.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: loginStore.textColor),
                        enabled: !loginStore.loading,
                        initialValue: loginStore.email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 9,
                            ),
                            errorText: loginStore.emailError),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: loginStore.setEmail,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3, bottom: 4, top: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Senha',
                              style: TextStyle(
                                color: loginStore.textColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Text(
                                'Esqueceu sua senha?',
                                style: TextStyle(
                                    color: loginStore.textColor ??
                                        Theme.of(context).colorScheme.primary,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextFormField(
                        style: TextStyle(color: loginStore.textColor),
                        enabled: !loginStore.loading,
                        initialValue: loginStore.password,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 9),
                            errorText: loginStore.passwordError),
                        obscureText: true,
                        onChanged: loginStore.setPassword,
                      ),
                      const SizedBox(height: 16),
                      LayoutBuilder(
                        builder: (context, constraints) => Container(
                          alignment: Alignment.center,
                          height: 40,
                          margin: EdgeInsets.only(top: 12, bottom: 4),
                          child: loginStore.loading
                              ? Transform.translate(
                                  offset: Offset(0, -9),
                                  child: SizedBox(
                                    width: 25,
                                    height: 25,
                                    child: CircularProgressIndicator(
                                      strokeWidth: gCircularProgressStrokeWidh,
                                    ),
                                  ),
                                )
                              : ConstrainedBox(
                                  constraints: BoxConstraints(
                                      minWidth: constraints.maxWidth),
                                  child: ElevatedButton(
                                    onPressed: loginStore.loginPressed,
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: loginStore.loading
                                          ? Colors.transparent
                                          : Theme.of(context)
                                              .colorScheme
                                              .primary,
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text('ENTRAR'),
                                  ),
                                ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          Text(
                            'Não tem uma conta? ',
                            style: TextStyle(
                              color: loginStore.textColor,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 0),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => SignUpScreen()));
                            },
                            child: Text(
                              'Cadastre-se',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: loginStore.textColor ??
                                    Theme.of(context).colorScheme.primary,
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
