import 'package:flutter/material.dart';
import 'package:project_akhir_movie/app.dart';
import 'package:project_akhir_movie/data/repositori/movierepositori.dart';
import 'package:project_akhir_movie/data/services/apiclient.dart';
import 'package:project_akhir_movie/data/services/providers/movieproviders.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("MovieApp"),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: Column(children: [
              _createImage(),
              _usernameField(),
              _passwordField(),
              _loginButton(context),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _createImage() {
    return Container(
      child: Image.network(
          "data:image/png;base64,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"),
    );
  }

  Widget _usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
          hintText: 'Username',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide:
            BorderSide(color: (isLoginSuccess) ? Colors.deepPurple : Colors.deepPurple),
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        obscureText: true,
        onChanged: (value) {
          password = value;
        },
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: const EdgeInsets.all(8.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide: BorderSide(color: Colors.deepPurple),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            borderSide:
            BorderSide(color: (isLoginSuccess) ? Colors.deepPurple : Colors.deepPurple),
          ),
        ),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSuccess) ? Colors.deepPurple : Colors.deepPurple, // background
          onPrimary: Colors.white, // foreground
        ),
        onPressed: () {
          String text = "";
          if (username == "user" && password == "user") {
            setState(() {
              text = "Login Success";
              isLoginSuccess = true;
            });
            _loginProcess(context);
          } else {
            setState(() {
              text = "Login Failed";
              isLoginSuccess = false;
            });
          }
          print("isLoginSuccess : $isLoginSuccess");
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login'),
      ),
    );
  }

  void _loginProcess(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return App(
        movieRepository: MovieRepository(MovieProviders(ApiClient())),
      );
    }));
  }
}
