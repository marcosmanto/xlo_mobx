import 'package:flutter/material.dart';
import '../../screens/login/login_screen.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => LoginScreen(),
          ),
        );
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Acesse sua conta',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Clique aqui',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
