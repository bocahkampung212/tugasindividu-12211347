import 'dart:js';

import 'package:aplikasipendataanwarga/providers/dashboard_provider.dart';
import 'package:aplikasipendataanwarga/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class dashboardview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final panels = [dashboardpanel(), tombolmenu(), SizedBox()];
    return Consumer<dashboaradprovider>(builder: (context, provider, widget) {
      return Scaffold(
          bottomNavigationBar: NavigatorBawah(),
          body: panels[provider.indextombol]);
    });
  }
}

class dashboardpanel extends StatelessWidget {
  const dashboardpanel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/background.jpg'),
        InformasiPengguna(),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 200),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              margin: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    LabelBerita(),
                    ListBerita(),
                    SizedBox(
                      height: 40,
                    ),
                    Wrap(
                      children: [
                        tombolmenu(
                          image: Image.asset(
                            'assets/icon1.png',
                            width: 50,
                          ),
                        ),
                        tombolmenu(
                          image: Image.asset(
                            'assets/icon2.png',
                            width: 50,
                          ),
                        ),
                        tombolmenu(
                          image: Image.asset(
                            'assets/icon3.png',
                            width: 50,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class tombolmenu extends StatelessWidget {
  final Image? image;
  const tombolmenu({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 9,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(8),
      child: Padding(
          padding: const EdgeInsets.all(18.0), child: image ?? SizedBox()),
    );
  }
}

class ListBerita extends StatelessWidget {
  const ListBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/berita1.jpg',
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/berita2.jpg',
                height: 120,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                'assets/berita3.jpg',
                height: 120,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LabelBerita extends StatelessWidget {
  const LabelBerita({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text('Berita'),
      ),
    );
  }
}

class NavigatorBawah extends StatelessWidget {
  const NavigatorBawah({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final p = context.read<dashboaradprovider>();

    return BottomNavigationBar(
      currentIndex: p.indextombol,
      onTap: (value) {
        p.saatdiklik(value);
      },
      items: [
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.house), label: 'home'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.newspaper), label: 'berita'),
        BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.gear), label: 'pengaturan'),
      ],
    );
  }
}

class InformasiPengguna extends StatelessWidget {
  const InformasiPengguna({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 70, 30, 35),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              'assets/foto.jpg',
              width: 80,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, ryo wikky wirianto',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60),
                ),
                Text(
                  'ryowikkywirianto@gmail.com',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/bell.png',
            width: 40,
          ),
        ],
      ),
    );
  }
}
