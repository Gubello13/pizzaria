import 'package:flutter/material.dart';
import 'package:loja_dibello/models/user_model.dart';
import 'package:loja_dibello/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();





  @override
  Widget build(BuildContext context) {
    return Scaffold(

      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("Entrar"),
          centerTitle: true,
          actions: <Widget>[
            FlatButton(
              child: Text(
                "CRIAR CONTA",
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
              textColor:  Colors.white,
              onPressed: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context)=> SignUpScreen())
                );
              },

            )
          ],
        ),
        body: ScopedModelDescendant<UserModel>(


          builder: (context, child, model){
            if (model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return Form(
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,

                    decoration: InputDecoration(
                      icon: Icon(Icons.alternate_email),
                        hintText: "E-mail"
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      if(text.isEmpty || !text.contains("@")) return "E-mail invalido!";
                    },
                  ),
                  SizedBox(height: 16.0,),

                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.security),
                        hintText: "Senha"
                    ),
                    obscureText: true,
                    validator: (text){
                      if(text.isEmpty || text.length < 6) return "Senha Invalida";
                    },

                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: (){
                        if(_emailController.text.isEmpty)
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Insira seu Email para recuperação!"),
                                backgroundColor: Colors.red,
                                duration: Duration(seconds: 2),
                              )
                          );
                        else {
                          model.recoverPass(_emailController.text);
                          _scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text("Confira seu Email!"),
                                backgroundColor: Theme.of(context).primaryColor,
                                duration: Duration(seconds: 2),
                              )
                          );
                        }
                      },
                      child: Text("Esqueci minha senha",
                        textAlign: TextAlign.right,

                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(height: 16.0,),
                  SizedBox(
                    height: 50.0,
                    child: RaisedButton(
                      child: Text("Entrar",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      textColor: Colors.white,
                      color: Colors.black,
                      onPressed: (){
                        if (_formkey.currentState.validate()){


                        }

                        model.signIn(
                            email: _emailController.text,
                            pass: _passController.text,
                            onSuccess: _onSuccess,
                            onFail: _onFail


                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        )
    );
  }

  void _onSuccess(){
  Navigator.of(context).pop();

  }

  void _onFail(){
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("Falha ao Entrar!"),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        )
    );


  }



}


