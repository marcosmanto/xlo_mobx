import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Acessar com E-mail:',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 4, top: 16),
                    child: Text(
                      'E-mail',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 9)),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 3, bottom: 4, top: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Senha',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Esqueceu sua senha?',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 8, vertical: 9),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(top: 12, bottom: 4),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text('ENTRAR'),
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
                          fontSize: 16,
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => SignUpScreen()));
                        },
                        child: Text(
                          'Cadastre-se',
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
