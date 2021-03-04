import 'package:eralpsoftware_p/pages/anasayfa.dart';
import 'package:eralpsoftware_p/pages/profil.dart';
import 'package:flutter/material.dart';


class YonlendirmeSayfasi extends StatefulWidget {
  @override
  _YonlendirmeSayfasiState createState() => _YonlendirmeSayfasiState();
}

class _YonlendirmeSayfasiState extends State<YonlendirmeSayfasi> {
  int _aktifIcerikNo = 0;
  List<Widget> _icerikler;

  @override
  void initState() {
    super.initState();

    _icerikler = [
      Anasayfa(),
      Profil(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 2.0,
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: _icerikler[_aktifIcerikNo],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _aktifIcerikNo,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ("Anasayfa")),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ("Profil")),
        ],
        onTap: (int tiklananButonPozisyonNo) {
          setState(() {
            _aktifIcerikNo = tiklananButonPozisyonNo;
          });
        },
      ),
    );
  }
}
