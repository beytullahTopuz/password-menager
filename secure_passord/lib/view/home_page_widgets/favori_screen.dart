import 'package:flutter/material.dart';

import 'package:secure_passord/helpers/db_helper.dart';
import 'package:secure_passord/models/password_model.dart';

import '../add_password.dart';

class FavoriView extends StatefulWidget {
  @override
  _FavoriViewState createState() => _FavoriViewState();
}

class _FavoriViewState extends State<FavoriView> {
  DBHelper helper;
  List<PasswordModel> passwordsList = [];
  @override
  void initState() {
    super.initState();
    helper = DBHelper();

    helper.open();
  }

  String _cuttentPassword = "**********";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.remove_red_eye_rounded,
              ),
              color: Colors.black,
            ),
          ),
        ],
        leading: Center(
            child: Text(
          "Favori",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: _buildBody(),
      floatingActionButton: FloatingActionButton(
        elevation: 500,
        backgroundColor: Color(0xffAA88F9),
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddPassword()))
              .then((value) {
            setState(() {});
          });
        },
      ),
    );
  }

  Container _buildBody() {
    return Container(
      margin: EdgeInsets.only(top: 18, left: 2, right: 2),
      child: buildFutureBuilder,
    );
  }

  get buildFutureBuilder {
    return FutureBuilder(
      future: _getListelenew(),
      builder: (contex, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasData) return mylistView(snap.data);
          return Text('Veri Yok');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  ListView mylistView(List<PasswordModel> p) {
    return ListView.builder(
        itemCount: p.length,
        itemBuilder: (context, index) {
          var password = p[index].password;
          return new Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: Colors.blue.shade200,
                borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              isThreeLine: true,
              title: Text(p[index].name),
              leading: Image.asset(
                p[index].imgUrl,
              ),
              trailing: Column(
                children: [
                  Expanded(
                      child: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _delete(p[index].id);
                    },
                  )),
                  Expanded(
                      child: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye_rounded,
                    ),
                    onPressed: () {
                      setState(() {
                        if (_cuttentPassword != "**********") {
                          _cuttentPassword = "**********";
                        } else {
                          _cuttentPassword = password;
                        }
                      });
                    },
                  ))
                ],
              ),
              subtitle: Column(
                children: [
                  Text(p[index].username + "   " + _cuttentPassword),
                ],
              ),
            ),
          );
        });
  }

  Future _getListele() async {
    passwordsList = await helper.getList();
    setState(() {});
  }

  Future<List<PasswordModel>> _getListelenew() async {
    passwordsList = await helper.getList();
    print("list: " + passwordsList.toString());

    return passwordsList;
  }

  Future _delete(int id) async {
    await helper.deleteItem(id);
    _getListele();
    setState(() {});
  }
}
