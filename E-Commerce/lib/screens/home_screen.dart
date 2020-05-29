import 'package:docesnathally/tabs/crono_tab.dart';
import 'package:docesnathally/tabs/home_tab.dart';
import 'package:docesnathally/tabs/orders_tab.dart';
import 'package:docesnathally/tabs/product_tab.dart';
import 'package:docesnathally/widgets/cart_button.dart';
import 'package:docesnathally/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer:CustomDrawer(_pageController),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(title: Text("Produtos", style: TextStyle(color: Colors.white)),centerTitle: true,iconTheme: IconThemeData(color: Colors.white),),
          drawer:CustomDrawer(_pageController),
          body:ProdutosTab(),
          floatingActionButton: CartButton(),
        ),
        Scaffold(
          appBar: AppBar(title: Text("Cronograma da Semana", style: TextStyle(color: Colors.white)),centerTitle: true,iconTheme: IconThemeData(color: Colors.white),),
          drawer:CustomDrawer(_pageController),
          body:CronoTab(),
          floatingActionButton: CartButton(),
        ),Scaffold(
          appBar: AppBar(title: Text("Meus Pedidos", style: TextStyle(color: Colors.white)),centerTitle: true,iconTheme: IconThemeData(color: Colors.white),),
          drawer:CustomDrawer(_pageController),
          body:OrdersTab(),
        ),
      ],
    );
  }
}
