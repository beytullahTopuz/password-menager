import 'package:flutter/material.dart';

import 'package:secure_passord/view/home_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  var safeImg = "assets/img/safeimg.png";
  var faceimg = "assets/img/ficon.png";
  var safeText = "Güvenli şifreleme aracı";
  var gicon = "assets/img/gicon.png";
  var appName = "Secure Password";
  var description = "Güvenli şifre yönetimi";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffA785F9), Color(0xff7150F1)])),
        height: double.infinity,
        width: double.infinity,
        child: _buildBody(),
      ),
    );
  }

  _buildBody() {
    return Center(
      child: Column(
        children: [
          Spacer(
            flex: 15,
          ),
          Expanded(
              flex: 9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Center(
                      child: Image.asset(
                        safeImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Text(
                    appName,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                ],
              )),
          Spacer(
            flex: 5,
          ),
          Expanded(
              flex: 12,
              child: Center(
                  child: Text(
                safeText,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontWeight: FontWeight.bold)
                    .copyWith(color: Colors.amberAccent),
              ))),
          Spacer(
            flex: 10,
          ),
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                "Login with",
                style: _style(),
              ))),
          Expanded(flex: 6, child: _buildLoginRow()),
          Expanded(
              flex: 8,
              child: Center(
                  child: Text(
                "Or",
                style: _style(),
              ))),
          Expanded(
              flex: 8,
              child: _buildCreateLoginAccount(
                  "Hesap Oluştur",
                  Icon(
                    Icons.create_sharp,
                    color: Colors.white,
                  ),
                  () {})),
          Spacer(),
          Expanded(
              flex: 8,
              child: _buildCreateLoginAccount(
                  "Giriş Yap",
                  Icon(
                    Icons.login,
                    color: Colors.white,
                  ), () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (contex) => HomePage()));
              })),
          Spacer(
            flex: 3,
          )
        ],
      ),
    );
  }

  TextStyle _style() {
    return Theme.of(context).textTheme.headline6.copyWith(color: Colors.white);
  }

  Row _buildLoginRow() {
    return Row(
      //  mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(
          flex: 6,
        ),
        Expanded(
          flex: 3,
          child: InkWell(
            child: Image.asset(faceimg),
          ),
        ),
        Spacer(),
        Expanded(
          flex: 3,
          child: InkWell(
              child: Image.asset(
            gicon,
            fit: BoxFit.cover,
          )),
        ),
        Spacer(
          flex: 6,
        )
      ],
    );
  }

  _buildCreateLoginAccount(String label, Icon icon, Function f) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: ElevatedButton.icon(
        icon: icon,
        label: Text(
          label,
          style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(MediaQuery.of(context).size),
            foregroundColor: MaterialStateProperty.all(Color(0xff2196F3))),
        onPressed: f,
      ),
    );
  }
}
