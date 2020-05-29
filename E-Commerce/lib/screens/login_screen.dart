import 'package:docesnathally/models/user_model.dart';
import 'package:docesnathally/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar",style: TextStyle(color: Colors.white),) ,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          FlatButton(onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignUpScreen()));},
            child: Text("CRIAR CONTA",style: TextStyle(fontSize: 15),),textColor: Colors.white,
          ),
        ],
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context,child,model){
          if(model.isLoading)
            return Center(child: CircularProgressIndicator(),);
          return Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (text){if(text.isEmpty || !text.contains("@")) return "E-mail Inválido";
                  },
                ),
                SizedBox(height: 16,),
                TextFormField(
                  controller: _passController,
                  decoration: InputDecoration(
                    hintText: "Senha",
                  ),
                  obscureText: true,
                  validator: (text) {
                    if (text.isEmpty || text.length < 6) return "Senha Inválida";
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){
                      if(_emailController.text.isEmpty){
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content:
                            Text("Coloque seu email para recuperar a senha!"),
                              backgroundColor: Colors.redAccent,
                              duration: Duration(seconds: 2),
                            )
                        );
                      }else{
                        model.recoverPass(_emailController.text);
                        _scaffoldKey.currentState.showSnackBar(
                            SnackBar(content:
                            Text("Confira seu email!"),
                              backgroundColor: Theme.of(context).primaryColor,
                              duration: Duration(seconds: 2),
                            )
                        );
                      }
                    },
                    child: Text("Esqueci minha senha",textAlign: TextAlign.right,),
                    padding: EdgeInsets.zero,
                  ),
                ),
                SizedBox(height: 16,),
                SizedBox(height: 44,
                  child: RaisedButton(
                    child: Text("Entrar",style: TextStyle(fontSize: 18),),
                    textColor: Colors.white,
                    color: Theme.of(context).primaryColor,
                    onPressed: (){
                      if(_formKey.currentState.validate()){

                      }
                      model.signIn(
                        email: _emailController.text,
                        pass:  _passController.text,
                        onSuccess: _onSuccess,
                        onFail: _onFail,
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  void _onSuccess(){
    Navigator.of(context).pop();
  }
  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(content:
      Text("Falha ao Entrar!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
