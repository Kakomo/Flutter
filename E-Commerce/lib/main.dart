import 'package:docesnathally/models/cart_model.dart';
import 'package:docesnathally/models/user_model.dart';
import 'package:docesnathally/screens/home_screen.dart';
import 'package:docesnathally/screens/login_screen.dart';
import 'package:docesnathally/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: ScopedModelDescendant<UserModel>(
        builder:(context,child,model){
          return ScopedModel<CartModel>(
            model: CartModel(model),
            child:MaterialApp(
                title: 'Doces Nathally',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    primaryColor: Color.fromARGB(255, 255, 158, 181)
                ),
                debugShowCheckedModeBanner: false,
                home: HomeScreen()

            ),
          );
        }
      ),
    );
  }
}
