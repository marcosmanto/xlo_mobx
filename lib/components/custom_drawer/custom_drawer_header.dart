import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/stores/page_store.dart';

import '../../screens/login/login_screen.dart';
import '../../stores/user_manager_store.dart';

class CustomDrawerHeader extends StatelessWidget {
  CustomDrawerHeader({super.key});

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();

        if (userManagerStore.isLoggedIn) {
          GetIt.I<PageStore>().setPage(4);
        } else {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => LoginScreen(),
            ),
          );
        }
      },
      child: Container(
        color: Colors.purple,
        height: 95,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 35,
            ),
            SizedBox(width: 18),
            Expanded(
              child: Observer(builder: (_) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userManagerStore.isLoggedIn
                          ? userManagerStore.user!.name
                          : 'Acesse sua conta',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        userManagerStore.isLoggedIn
                            ? userManagerStore.user!.email
                            : 'Clique aqui',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    if (userManagerStore.isLoggedIn)
                      Container(
                        height: 22,
                        width: 80,
                        margin: const EdgeInsets.only(top: 6),
                        child: ElevatedButton(
                          onPressed: userManagerStore.clearUser,
                          style: ElevatedButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.primary,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Text(
                            'SAIR',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
