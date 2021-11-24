import 'package:flutter/material.dart';
import 'package:food_bar/models/user_manager.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 8),
      height: 180,
      child: Consumer<UserManager>(
        builder: (_, userManager, __){
          return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            RichText(
              text: TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .title
                      .copyWith(fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: "Card",
                        style: TextStyle(color: Colors.black, fontSize: 30)),
                    TextSpan(
                        text: "App", style: TextStyle(color: Color(0xffff0000), fontSize: 30)),
                    TextSpan(
                        text: "io", style: TextStyle(color: Colors.black, fontSize: 30)),
                  ]),
            ),
            Text(
              'Olá, ${userManager.user?.name ?? ''}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            GestureDetector(
              onTap: (){
                if(userManager.isLoggedIn){
                  userManager.signOut();
                } else {
                  Navigator.of(context).pushNamed('/login');
                }
              },
              child: Text(
                userManager.isLoggedIn
                    ? 'Sair'
                    : 'Entre ou cadastre-se >',
                style: const TextStyle(
                  color: Color(0xfff50202),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
           );
    },
    )
    );
  }
}
