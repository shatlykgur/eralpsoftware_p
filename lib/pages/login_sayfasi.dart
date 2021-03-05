import 'dart:convert';
import 'package:eralpsoftware_p/pages/yonlendirme_sayfasi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginSayfa extends StatefulWidget {
  @override
  _LoginSayfaState createState() => _LoginSayfaState();
}

class _LoginSayfaState extends State<LoginSayfa> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.orange,
              Colors.red,
            ],
          ),
        ),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  textSection(),
                  buttonSection(),
                ],
              ),
      ),
    );
  }

  signIn(String username, password) async {
    Map jsonEncode = {
      "username": username,
      "password": password,
    };

    var jsonData = null;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var response = await http
        .post("https://aodapi.eralpsoftware.net/login/apply", body: jsonEncode);
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString("token", jsonData["token"]);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (BuildContext context) => YonlendirmeSayfasi()),
            (Route<dynamic> route) => false);
      });
    } else {
      print(response.body);
    }
  }

  Container buttonSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      margin: EdgeInsets.only(top: 30.0),
      child: RaisedButton(
        onPressed: () {
          setState(() {
            _isLoading = true;
          });
          signIn(emailController.text, passwordController.text);
        },
        color: Colors.yellow,
        child: Text("Sign In", style: TextStyle(color: Colors.white)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Container textSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        children: [
          TextFormField(
            controller: emailController,
            cursorColor: Colors.yellow,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.white),
              hintText: "Email",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          TextFormField(
            controller: passwordController,
            cursorColor: Colors.yellow,
            obscureText: true,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.white),
              hintText: "Password",
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
