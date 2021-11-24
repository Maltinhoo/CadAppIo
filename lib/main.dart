import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_bar/models/cart_manager.dart';
import 'package:food_bar/models/home_manager.dart';
import 'package:food_bar/models/product.dart';
import 'package:food_bar/models/product_manager.dart';
import 'package:food_bar/models/user_manager.dart';
import 'package:food_bar/screens/base/base_screen.dart';
import 'package:food_bar/screens/cart/cart_screen.dart';
import 'package:food_bar/screens/login/login_screen.dart';
import 'package:food_bar/screens/product/product_screen.dart';
import 'package:food_bar/screens/signup/signup_screen.dart';
import 'package:food_bar/screens/signup_company/signupcompany_screen.dart';
import 'package:food_bar/screens/type_account/type_account_screen.dart';
import 'package:provider/provider.dart';

// ignore: avoid_void_async
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserManager(), lazy: false,),
        ChangeNotifierProvider(create: (_) => ProductManager(), lazy: false,),
        ChangeNotifierProvider(create: (_) => HomeManager(), lazy: false,),
        ChangeNotifierProxyProvider<UserManager, CartManager>(
          create: (_) => CartManager(),
          lazy: false,
          update: (_, userManager, cartManager) =>
          cartManager..updateUser(userManager),
        ),
      ],
      child: MaterialApp(
        title: 'CardAppio',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 255, 0, 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/base',
        onGenerateRoute: (settings){
          switch(settings.name){
            case '/login':
              return MaterialPageRoute(
                  builder: (_) => LoginScreen()
              );
            case '/signup':
              return MaterialPageRoute(
                  builder: (_) => SignUpScreen()
              );
            case '/signupcompany':
              return MaterialPageRoute(
                  builder: (_) => SignUpCompanyScreen()
              );
            case '/product':
              return MaterialPageRoute(
                  builder: (_) => ProductScreen(
                    settings.arguments as Product
                  )
              );
            case '/cart':
              return MaterialPageRoute(
                  builder: (_) => CartScreen()
              );
            case '/typeaccount':
              return MaterialPageRoute(
                  builder: (_) => TypeAccountScreen()
              );
            default:
              return MaterialPageRoute(
                  builder: (_) => BaseScreen()
              );
          }
        },
      ),
    );
  }
}
