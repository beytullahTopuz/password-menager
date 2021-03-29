import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_passord/helpers/db_helper.dart';
import 'package:secure_passord/models/password_model.dart';
import 'package:get/get.dart';

class AddPassword extends StatefulWidget {
  @override
  _AddPasswordState createState() => _AddPasswordState();
}

class _AddPasswordState extends State<AddPassword> {
  DBHelper helper;
  @override
  void initState() {
    helper = DBHelper();
    helper.open();
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();

  String username;
  String password;
  String _valueChoose;
  List listItem = [
    "Twitter",
    "Instegram",
    "Gmail",
    "Facebook",
    "Diskord",
    "Netfilix",
    "Linkedln",
    "Diğer"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7857F2),
      appBar: AppBar(
        backgroundColor: Color(0xff7857F2),
        centerTitle: true,
        title: Text("Yeni Hesap Ekle", style: GoogleFonts.pacifico()),
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    var safeImg = "assets/img/safeimg.png";
    return Form(
      key: _formkey,
      child: ListView(
        padding: EdgeInsets.only(right: 25, left: 25),
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
              width: 90,
              height: 90,
              child: Image.asset(
                safeImg,
                fit: BoxFit.contain,
              )),
          SizedBox(
            height: 10,
          ),
          Center(
              child: Text("Hoşgeldiniz",
                  style: GoogleFonts.pacifico().copyWith(color: Colors.white))),
          Center(
            child: DropdownButton(
              hint: Text(
                "Platform Seçininz",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              dropdownColor: Color(0xff2196F3),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.white,
              ),
              iconSize: 30,
              value: _valueChoose,
              onChanged: (newValue) {
                setState(() {
                  _valueChoose = newValue;
                });
              },
              items: listItem.map((valueitem) {
                return DropdownMenuItem(
                  value: valueitem,
                  child: Text(valueitem,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Boş birakılamaz";
              }
              username = value;
              return null;
            },
            style:
                TextStyle(color: (Colors.white), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                hintText: "Kullanıcı Adı:",
                icon: Icon(
                  Icons.contact_mail_outlined,
                  color: Color(0xff2196F3),
                )),
          ),
          SizedBox(
            height: 35,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return "Boş birakılamaz";
              }
              password = value;
              return null;
            },
            obscureText: true,
            style:
                TextStyle(color: (Colors.white), fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                hintText: "Şifre:",
                icon: Icon(
                  Icons.lock_rounded,
                  color: Color(0xff2196F3),
                )),
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            child: Text(
              "Kaydet",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              if (_formkey.currentState.validate()) {
                print("kaydet");
                String _name;
                if (_valueChoose != null) {
                  _name = _valueChoose;
                } else {
                  _name = "Diğer";
                }

                _kaydet(_name, username, password);
              }
            },
          ),
        ],
      ),
    );
  }

  void _kaydet(String name, String username, String password) async {
    String templogoUrl;
    String twitter = "assets/img/logoimg/twitter.png";
    String netfilix = "assets/img/logoimg/netfilix.png";
    String linktin = "assets/img/logoimg/linktin.png";
    String instegram = "assets/img/logoimg/instegram.png";
    String gmail = "assets/img/logoimg/gmail.png";
    String diskord = "assets/img/logoimg/diskord.png";
    String facebook = "assets/img/ficon.png";
    String diger = "assets/img/safeimg.png";

    List data = [
      twitter,
      instegram,
      gmail,
      facebook,
      diskord,
      netfilix,
      linktin,
      diger
    ];

    int index = listItem.indexOf(name);

    if (index != -1) {
      templogoUrl = data[index];
    } else {
      templogoUrl = data[7];
    }
    var p = PasswordModel(
        name: name,
        username: username,
        password: password,
        imgUrl: templogoUrl);

    var result = await helper.insertItem(p);

    print(result);
    Navigator.pop(context);
  }
}
