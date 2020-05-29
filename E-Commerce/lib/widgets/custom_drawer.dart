import 'package:docesnathally/models/user_model.dart';
import 'package:docesnathally/screens/login_screen.dart';
import 'package:docesnathally/tiles/drawer_tile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Color.fromARGB(255, 139, 204, 202),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        );

    return Drawer(
      child: Stack(
        children: [
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32, top: 16),
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                padding: EdgeInsets.fromLTRB(0, 16, 16, 8),
                height: 170,
                child: Stack(
                  children: [
                    Positioned(
                      top: 8,
                      left: 0,
                      child: Stack(
                        children: [
                          Text(
                            "Doces\nNáthally",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 1
                                ..color = Color.fromARGB(255, 255, 192, 203),
                            ),
                          ),
                          Text(
                            "Doces\nNáthally",
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 158, 181),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 0.0,
                      bottom: 0.0,
                      child: ScopedModelDescendant<UserModel>(
                        builder: (context,child,model){
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Text(
                                    "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      foreground: Paint()
                                        ..style = PaintingStyle.stroke
                                        ..strokeWidth = 1
                                        ..color =
                                        Color.fromARGB(255, 255, 192, 203),
                                    ),
                                  ),
                                  Text(
                                    "Olá, ${!model.isLoggedIn() ? "" : model.userData["name"]}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 255, 158, 181),
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: (){
                                  if(!model.isLoggedIn())
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
                                  else
                                    model.signOut();
                                  },
                                child: Text(!model.isLoggedIn() ? "Entre ou cadastre-se": "Sair",

                                    style: TextStyle(
                                        color: Color.fromARGB(255, 4, 125, 142),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(Icons.home,"Inicio",pageController,0),
              DrawerTile(Icons.list,"Produtos",pageController,1),
              DrawerTile(Icons.access_time,"Cronograma da Semana",pageController,2),
              DrawerTile(Icons.playlist_add_check,"Meus Pedidos",pageController,3),
            ],
          ),
        ],
      ),
    );
  }
}
