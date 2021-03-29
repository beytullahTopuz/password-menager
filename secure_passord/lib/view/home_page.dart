import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure_passord/view/home_page_widgets/favori_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //? selectedMenu değerleri : 'favori', 'all','social'
  var _selectedMenuindex = 0;

  // ignore: unused_field
  List _widgetOptions = [
    FavoriView(),
    Text(
      'Index 1: sosyal medya',
    ),
    Text(
      'Index 2: hepsi',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Row(
      children: [
        _leftMenu(),
        _home(),
      ],
    );
  }

  Expanded _home() {
    return Expanded(
      flex: 8,
      child: Container(
        color: Colors.white,
        child: _widgetOptions[_selectedMenuindex],
      ),
    );
  }

  Expanded _leftMenu() {
    return Expanded(
      flex: 2,
      child: Container(
        color: Color(0xffAA88F9),
        child: Column(
          children: [
            Expanded(
                child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {})),
            Expanded(
                child: InkWell(
              onTap: () {
                setState(() {
                  _selectedMenuindex = 0;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      "Fovori",
                      style: GoogleFonts.lakkiReddy(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _selectedMenuindex == 0
                      ? Icon(
                          Icons.arrow_right_outlined,
                          color: Color(0xffFEC606),
                        )
                      : SizedBox()
                ],
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
                /*  setState(() {
                  _selectedMenuindex = 1;
                });
                */
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "Sosyal Medya",
                        style: GoogleFonts.lakkiReddy(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  _selectedMenuindex == 1
                      ? Icon(
                          Icons.arrow_right_outlined,
                          color: Color(0xffFEC606),
                        )
                      : SizedBox()
                ],
              ),
            )),
            Expanded(
                child: InkWell(
              onTap: () {
/*
                setState(() {
                  _selectedMenuindex = 2;
                });
                */
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        "Hepsi",
                        style: GoogleFonts.lakkiReddy(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  _selectedMenuindex == 2
                      ? Icon(
                          Icons.arrow_right_outlined,
                          color: Color(0xffFEC606),
                        )
                      : SizedBox()
                ],
              ),
            )),
            Expanded(
                child: IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {},
            ))
          ],
        ),
      ),
    );
  }
}
